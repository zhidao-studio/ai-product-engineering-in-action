#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
PACK_DIR="$TARGET_DIR/AI_CONTEXT_PACK"
STAGE_FILE="$PACK_DIR/00_当前阶段.md"

if [[ ! -f "$STAGE_FILE" ]]; then
  echo "[FAIL] 缺少当前阶段文件: $STAGE_FILE"
  echo "请先补齐 AI_CONTEXT_PACK/00_当前阶段.md"
  exit 1
fi

stage=$(grep -E "^当前阶段[:：]" "$STAGE_FILE" | head -n 1 | sed -E 's/^当前阶段[:：][[:space:]]*//' | tr -d '[:space:]')

if [[ -z "${stage:-}" ]]; then
  echo "[FAIL] 无法从 $STAGE_FILE 读取当前阶段。"
  echo "需要包含形如: 当前阶段：idea"
  exit 1
fi

repo_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [[ -z "$repo_root" ]]; then
  echo "[FAIL] 当前目录不在 Git 仓库内，无法检查变更。"
  exit 1
fi

cd "$repo_root"

echo "[AI Guard] 当前阶段: $stage"
echo "[AI Guard] 检查目标目录: $TARGET_DIR"

changed_files=$(mktemp)
trap 'rm -f "$changed_files"' EXIT

# 已跟踪文件的新增、修改、删除
if git rev-parse --verify HEAD >/dev/null 2>&1; then
  git diff --name-only HEAD -- "$TARGET_DIR" >> "$changed_files" || true
else
  git diff --name-only -- "$TARGET_DIR" >> "$changed_files" || true
fi

# 未跟踪文件
if [[ -d "$TARGET_DIR" ]]; then
  git ls-files --others --exclude-standard -- "$TARGET_DIR" >> "$changed_files" || true
fi

sort -u "$changed_files" -o "$changed_files"

fail_count=0

fail_file() {
  local file="$1"
  local reason="$2"
  echo "[FAIL] $file"
  echo "       原因: $reason"
  fail_count=$((fail_count + 1))
}

case "$stage" in
  idea)
    while IFS= read -r file; do
      [[ -z "$file" ]] && continue
      case "$file" in
        */AI_CONTEXT_PACK/*|AI_CONTEXT_PACK/*)
          ;;
        */docs/01_产品定义.md|docs/01_产品定义.md)
          ;;
        */01_产品定义.md|01_产品定义.md)
          ;;
        *)
          fail_file "$file" "idea 阶段只允许生成问题、选项、推荐方案和产品定义草案，不允许越级生成界面规格、工程规格、接口契约、数据库结构、任务包或工程代码。"
          ;;
      esac
    done < "$changed_files"
    ;;

  product_definition_draft)
    while IFS= read -r file; do
      [[ -z "$file" ]] && continue
      case "$file" in
        */AI_CONTEXT_PACK/*|AI_CONTEXT_PACK/*|*/docs/01_产品定义.md|docs/01_产品定义.md|*/01_产品定义.md|01_产品定义.md)
          ;;
        *)
          fail_file "$file" "product_definition_draft 阶段只能修改产品定义相关内容，不允许生成后续阶段产物。"
          ;;
      esac
    done < "$changed_files"
    ;;

  product_definition_confirmed|ui_spec_draft)
    while IFS= read -r file; do
      [[ -z "$file" ]] && continue
      case "$file" in
        */AI_CONTEXT_PACK/*|AI_CONTEXT_PACK/*|*/docs/01_产品定义.md|docs/01_产品定义.md|*/docs/02_界面规格.md|docs/02_界面规格.md|*/01_产品定义.md|01_产品定义.md|*/02_界面规格.md|02_界面规格.md|*/prototypes/*|prototypes/*)
          ;;
        *)
          fail_file "$file" "当前阶段只允许处理产品定义、界面规格或高保真原型，不允许生成工程实现产物。"
          ;;
      esac
    done < "$changed_files"
    ;;

  prototype_generated)
    while IFS= read -r file; do
      [[ -z "$file" ]] && continue
      case "$file" in
        */AI_CONTEXT_PACK/*|AI_CONTEXT_PACK/*|*/docs/02_5_原型预览确认记录.md|docs/02_5_原型预览确认记录.md|*/02_5_原型预览确认记录.md|02_5_原型预览确认记录.md|*/prototypes/*|prototypes/*)
          ;;
        *)
          fail_file "$file" "prototype_generated 阶段只能调整原型和原型确认记录，不允许进入工程规格或编码。"
          ;;
      esac
    done < "$changed_files"
    ;;

  prototype_confirmed|engineering_spec_confirmed|contract_confirmed|task_package_confirmed|coding|verification|acceptance|delivered)
    echo "[OK] 当前阶段 $stage 由后续边界检查继续约束。"
    ;;

  *)
    echo "[FAIL] 未知阶段: $stage"
    echo "请检查 文档/控制系统/01_阶段状态机.md 中定义的阶段。"
    exit 1
    ;;
esac

if [[ "$fail_count" -gt 0 ]]; then
  echo "[FAIL] 阶段越级检查未通过，共 $fail_count 个文件不允许在当前阶段修改。"
  exit 1
fi

echo "[OK] 阶段越级检查通过。"
