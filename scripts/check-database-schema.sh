#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
PACK_DIR="$TARGET_DIR/AI_CONTEXT_PACK"
STAGE_FILE="$PACK_DIR/00_当前阶段.md"
SCHEMA_FILE="$TARGET_DIR/contracts/database-schema.yaml"

stage="unknown"
if [[ -f "$STAGE_FILE" ]]; then
  stage=$(grep -E "^当前阶段[:：]" "$STAGE_FILE" | head -n 1 | sed -E 's/^当前阶段[:：][[:space:]]*//' | tr -d '[:space:]')
fi

echo "[AI Guard] 数据库 Schema 契约检查"
echo "[AI Guard] 当前阶段: ${stage:-unknown}"
echo "[AI Guard] 契约文件: $SCHEMA_FILE"

requires_contract=false
case "$stage" in
  contract_confirmed|task_package_confirmed|coding|verification|acceptance|delivered)
    requires_contract=true
    ;;
esac

if [[ ! -f "$SCHEMA_FILE" ]]; then
  if [[ "$requires_contract" == "true" ]]; then
    echo "[FAIL] 当前阶段已进入契约/工程阶段，但缺少数据库 Schema 契约: $SCHEMA_FILE"
    echo "请从 样板/控制系统/contracts/database-schema.yaml 复制后按项目补齐。"
    exit 1
  fi
  echo "[WARN] 未找到数据库 Schema 契约。当前阶段尚未强制要求，跳过深度检查。"
  exit 0
fi

fail_count=0

require_text() {
  local pattern="$1"
  local message="$2"
  if ! grep -Eq "$pattern" "$SCHEMA_FILE"; then
    echo "[FAIL] $message"
    fail_count=$((fail_count + 1))
  else
    echo "[OK] $message"
  fi
}

require_text "^database:" "包含 database 节点"
require_text "^tables:" "包含 tables 节点"
require_text "id_strategy:" "声明主键策略"
require_text "32.*字符串|32位字符串|CHAR\(32\)" "声明 32 位字符串主键规则"
require_text "primary_key:" "包含 primary_key 定义"
require_text "type:[[:space:]]*CHAR\(32\)" "主键或关联 ID 使用 CHAR(32)"
require_text "auto_increment:[[:space:]]*false" "主键禁止自增"
require_text "seven_elements:" "包含每表 7 要素声明"

seven_elements=(id created_by created_at updated_by updated_at is_valid is_deleted)
for element in "${seven_elements[@]}"; do
  require_text "${element}:" "包含 7 要素字段: ${element}"
done

# 如果出现 migration 变更，要求 database-schema.yaml 也同步变更。
repo_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [[ -n "$repo_root" ]]; then
  cd "$repo_root"
  changed_files=$(mktemp)
  trap 'rm -f "$changed_files"' EXIT
  git diff --name-only HEAD -- "$TARGET_DIR" > "$changed_files" || true
  git ls-files --others --exclude-standard -- "$TARGET_DIR" >> "$changed_files" || true
  sort -u "$changed_files" -o "$changed_files"

  if grep -Eq "/db/migration/|V[0-9]+__.*\.sql$" "$changed_files"; then
    if ! grep -Fxq "$SCHEMA_FILE" "$changed_files"; then
      echo "[WARN] 检测到数据库 migration 变更，但 database-schema.yaml 未同步变更。请确认数据库契约是否需要更新。"
    fi
  fi
fi

if [[ "$fail_count" -gt 0 ]]; then
  echo "[FAIL] 数据库 Schema 契约检查未通过，共 $fail_count 个问题。"
  exit 1
fi

echo "[OK] 数据库 Schema 契约检查通过。"
