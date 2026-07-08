#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
PACK_DIR="$TARGET_DIR/AI_CONTEXT_PACK"
STAGE_FILE="$PACK_DIR/00_当前阶段.md"
OPENAPI_FILE="$TARGET_DIR/contracts/openapi.yaml"

stage="unknown"
if [[ -f "$STAGE_FILE" ]]; then
  stage=$(grep -E "^当前阶段[:：]" "$STAGE_FILE" | head -n 1 | sed -E 's/^当前阶段[:：][[:space:]]*//' | tr -d '[:space:]')
fi

echo "[AI Guard] OpenAPI 契约检查"
echo "[AI Guard] 当前阶段: ${stage:-unknown}"
echo "[AI Guard] 契约文件: $OPENAPI_FILE"

requires_contract=false
case "$stage" in
  contract_confirmed|task_package_confirmed|coding|verification|acceptance|delivered)
    requires_contract=true
    ;;
esac

if [[ ! -f "$OPENAPI_FILE" ]]; then
  if [[ "$requires_contract" == "true" ]]; then
    echo "[FAIL] 当前阶段已进入契约/工程阶段，但缺少 OpenAPI 契约: $OPENAPI_FILE"
    echo "请从 样板/控制系统/contracts/openapi.yaml 复制后按项目补齐。"
    exit 1
  fi
  echo "[WARN] 未找到 OpenAPI 契约。当前阶段尚未强制要求，跳过深度检查。"
  exit 0
fi

fail_count=0

require_text() {
  local pattern="$1"
  local message="$2"
  if ! grep -Eq "$pattern" "$OPENAPI_FILE"; then
    echo "[FAIL] $message"
    fail_count=$((fail_count + 1))
  else
    echo "[OK] $message"
  fi
}

require_text "^openapi:[[:space:]]*3\." "包含 openapi 3.x 声明"
require_text "^info:" "包含 info 节点"
require_text "^paths:" "包含 paths 节点"
require_text "^components:" "包含 components 节点"
require_text "schemas:" "包含 schemas 定义"
require_text "operationId:" "至少包含一个 operationId"
require_text "responses:" "至少包含 responses 定义"
require_text '"200"|200:' "至少包含 200 响应定义"

# 如果项目中有 Controller 变更，要求 OpenAPI 文件也在本次 diff 中变更。
repo_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [[ -n "$repo_root" ]]; then
  cd "$repo_root"
  changed_files=$(mktemp)
  trap 'rm -f "$changed_files"' EXIT
  git diff --name-only HEAD -- "$TARGET_DIR" > "$changed_files" || true
  git ls-files --others --exclude-standard -- "$TARGET_DIR" >> "$changed_files" || true
  sort -u "$changed_files" -o "$changed_files"

  if grep -Eq "Controller\.java$|/controller/|/api/|services/.*\.(ts|js)$" "$changed_files"; then
    if ! grep -Fxq "$OPENAPI_FILE" "$changed_files"; then
      echo "[WARN] 检测到接口相关文件变更，但 OpenAPI 契约未同步变更。请确认接口契约是否需要更新。"
    fi
  fi
fi

if [[ "$fail_count" -gt 0 ]]; then
  echo "[FAIL] OpenAPI 契约检查未通过，共 $fail_count 个问题。"
  exit 1
fi

echo "[OK] OpenAPI 契约检查通过。"
