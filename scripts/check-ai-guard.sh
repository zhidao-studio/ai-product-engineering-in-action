#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[AI Guard] 开始执行 AI 门禁检查"
echo "[AI Guard] 目标目录: $TARGET_DIR"
echo ""

bash "$SCRIPT_DIR/check-ai-context-pack.sh" "$TARGET_DIR"
echo ""

bash "$SCRIPT_DIR/check-ai-stage.sh" "$TARGET_DIR"
echo ""

bash "$SCRIPT_DIR/check-ai-boundary.sh" "$TARGET_DIR"
echo ""

echo "[OK] AI 门禁检查全部完成。"
