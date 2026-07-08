#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
PACK_DIR="$TARGET_DIR/AI_CONTEXT_PACK"

required_files=(
  "00_当前阶段.md"
  "01_产品蓝图.yaml"
  "02_已确认决策.md"
  "03_允许修改范围.yaml"
  "04_工程基线摘要.md"
  "05_当前任务包.md"
)

missing_count=0

echo "[AI Guard] 检查 AI Context Pack: $PACK_DIR"

if [[ ! -d "$PACK_DIR" ]]; then
  echo "[FAIL] 缺少目录: $PACK_DIR"
  echo "说明: 目标项目必须先具备 AI_CONTEXT_PACK，AI 才能进入受控执行。"
  exit 1
fi

for file in "${required_files[@]}"; do
  if [[ ! -f "$PACK_DIR/$file" ]]; then
    echo "[FAIL] 缺少文件: $PACK_DIR/$file"
    missing_count=$((missing_count + 1))
  else
    echo "[OK] $PACK_DIR/$file"
  fi
done

if [[ "$missing_count" -gt 0 ]]; then
  echo "[FAIL] AI Context Pack 不完整，共缺少 $missing_count 个文件。"
  exit 1
fi

echo "[OK] AI Context Pack 完整。"
