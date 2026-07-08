#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
WHITELIST_FILE="$TARGET_DIR/contracts/dependency-whitelist.txt"

repo_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [[ -z "$repo_root" ]]; then
  echo "[FAIL] 当前目录不在 Git 仓库内，无法检查依赖变更。"
  exit 1
fi

cd "$repo_root"

echo "[AI Guard] 依赖白名单检查"
echo "[AI Guard] 白名单文件: $WHITELIST_FILE"

changed_files=$(mktemp)
trap 'rm -f "$changed_files"' EXIT

git diff --name-only HEAD -- "$TARGET_DIR" > "$changed_files" || true
git ls-files --others --exclude-standard -- "$TARGET_DIR" >> "$changed_files" || true
sort -u "$changed_files" -o "$changed_files"

if ! grep -Eq "(^|/)pom\.xml$|(^|/)package\.json$|(^|/)Package\.swift$" "$changed_files"; then
  echo "[OK] 未检测到依赖文件变更，跳过依赖白名单检查。"
  exit 0
fi

if [[ ! -f "$WHITELIST_FILE" ]]; then
  echo "[FAIL] 检测到依赖文件变更，但缺少依赖白名单: $WHITELIST_FILE"
  echo "请从 样板/控制系统/contracts/dependency-whitelist.txt 复制后按项目补齐。"
  exit 1
fi

fail_count=0

check_dependency_file() {
  local file="$1"
  echo "[AI Guard] 扫描依赖文件: $file"

  # 该脚本是最小文本级检查：
  # - 对新增行中可能出现的依赖关键字做白名单匹配。
  # - 不替代 npm audit、mvn dependency-check、SCA 等专业安全扫描。
  local added_lines
  added_lines=$(git diff HEAD -- "$file" | grep '^+' | grep -v '^+++' || true)

  if [[ -z "$added_lines" && -f "$file" ]]; then
    # 未跟踪新文件没有 diff 时，扫描全文。
    added_lines=$(cat "$file")
  fi

  # 从常见依赖声明中提取候选关键字。
  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    clean_line=$(echo "$line" | sed 's/^+//' | tr -d '"' | tr -d "'" | tr ',' ' ')

    # Maven artifactId
    if echo "$clean_line" | grep -Eq "<artifactId>[^<]+</artifactId>"; then
      dep=$(echo "$clean_line" | sed -E 's/.*<artifactId>([^<]+)<\/artifactId>.*/\1/')
    # package.json: "name": "version"
    elif echo "$clean_line" | grep -Eq "^[[:space:]]*[A-Za-z0-9_@./-]+[[:space:]]*:[[:space:]]*"; then
      dep=$(echo "$clean_line" | sed -E 's/^[[:space:]]*([A-Za-z0-9_@./-]+)[[:space:]]*:.*/\1/')
    # Swift Package url
    elif echo "$clean_line" | grep -Eq "package\(url:"; then
      dep=$(echo "$clean_line" | sed -E 's/.*package\(url:[[:space:]]*([^,]+).*/\1/' | sed -E 's#.*/([^/]+)\.git.*#\1#')
    else
      continue
    fi

    [[ -z "${dep:-}" ]] && continue

    if grep -Fxq "$dep" "$WHITELIST_FILE" || grep -Fq "$dep" "$WHITELIST_FILE"; then
      echo "[OK] 依赖在白名单内: $dep"
    else
      echo "[FAIL] 依赖不在白名单内: $dep"
      echo "       文件: $file"
      fail_count=$((fail_count + 1))
    fi
  done <<< "$added_lines"
}

while IFS= read -r file; do
  [[ -z "$file" ]] && continue
  case "$file" in
    */pom.xml|pom.xml|*/package.json|package.json|*/Package.swift|Package.swift)
      check_dependency_file "$file"
      ;;
  esac
done < "$changed_files"

if [[ "$fail_count" -gt 0 ]]; then
  echo "[FAIL] 依赖白名单检查未通过，共 $fail_count 个未批准依赖。"
  exit 1
fi

echo "[OK] 依赖白名单检查通过。"
