#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
PACK_DIR="$TARGET_DIR/AI_CONTEXT_PACK"
POLICY_FILE="$PACK_DIR/03_允许修改范围.yaml"

repo_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [[ -z "$repo_root" ]]; then
  echo "[FAIL] 当前目录不在 Git 仓库内，无法检查变更。"
  exit 1
fi

cd "$repo_root"

echo "[AI Guard] 检查 AI 修改边界: $TARGET_DIR"

if [[ ! -f "$POLICY_FILE" ]]; then
  echo "[FAIL] 缺少允许修改范围文件: $POLICY_FILE"
  echo "请先补齐 AI_CONTEXT_PACK/03_允许修改范围.yaml"
  exit 1
fi

changed_files=$(mktemp)
trap 'rm -f "$changed_files"' EXIT

if git rev-parse --verify HEAD >/dev/null 2>&1; then
  git diff --name-only HEAD -- "$TARGET_DIR" >> "$changed_files" || true
else
  git diff --name-only -- "$TARGET_DIR" >> "$changed_files" || true
fi

if [[ -d "$TARGET_DIR" ]]; then
  git ls-files --others --exclude-standard -- "$TARGET_DIR" >> "$changed_files" || true
fi

sort -u "$changed_files" -o "$changed_files"

fail_count=0
warn_count=0

fail_file() {
  local file="$1"
  local reason="$2"
  echo "[FAIL] $file"
  echo "       原因: $reason"
  fail_count=$((fail_count + 1))
}

warn_file() {
  local file="$1"
  local reason="$2"
  echo "[WARN] $file"
  echo "       原因: $reason"
  warn_count=$((warn_count + 1))
}

while IFS= read -r file; do
  [[ -z "$file" ]] && continue

  case "$file" in
    工程模板/*)
      fail_file "$file" "工程模板是基线资产，AI 执行业务任务时不得直接修改。"
      ;;
    文档/工程基线/*)
      fail_file "$file" "工程基线是系统级规则，业务任务不得直接修改。"
      ;;
    文档/控制系统/00_系统总览.md)
      fail_file "$file" "系统总览是总控入口，除非专门执行治理维护任务，否则不得修改。"
      ;;
    */pom.xml|pom.xml)
      fail_file "$file" "依赖文件需要审批，AI 不得擅自修改 pom.xml。"
      ;;
    */package.json|package.json)
      fail_file "$file" "依赖文件需要审批，AI 不得擅自修改 package.json。"
      ;;
    */Package.swift|Package.swift)
      fail_file "$file" "依赖文件需要审批，AI 不得擅自修改 Package.swift。"
      ;;
    */application.yml|application.yml|*/application.properties|application.properties)
      fail_file "$file" "应用配置可能包含环境和安全边界，AI 不得擅自修改。"
      ;;
    */db/migration/*)
      warn_file "$file" "数据库 migration 属于需审批变更。当前脚本先警告；如需强制阻断，可将 WARN 调整为 FAIL。"
      ;;
    */Dockerfile|Dockerfile|*/.github/workflows/*|.github/workflows/*)
      fail_file "$file" "部署和 CI 配置属于基础设施边界，AI 不得擅自修改。"
      ;;
  esac
done < "$changed_files"

if [[ "$fail_count" -gt 0 ]]; then
  echo "[FAIL] 修改边界检查未通过，共 $fail_count 个禁止修改文件。"
  exit 1
fi

if [[ "$warn_count" -gt 0 ]]; then
  echo "[WARN] 修改边界检查通过，但有 $warn_count 个需人工确认的高风险文件。"
else
  echo "[OK] 修改边界检查通过。"
fi
