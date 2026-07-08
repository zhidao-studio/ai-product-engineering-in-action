#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$REPO_ROOT"

echo "[AI Guard] 扫描所有目标项目"

if [[ "$#" -gt 0 ]]; then
  targets=("$@")
else
  mapfile -t targets < <(find . -type d -name "AI_CONTEXT_PACK" -not -path "./样板/*" -not -path "./.git/*" | sed 's#/AI_CONTEXT_PACK$##' | sed 's#^./##' | sort)
fi

if [[ "${#targets[@]}" -eq 0 ]]; then
  echo "[WARN] 未发现目标项目 AI_CONTEXT_PACK。"
  echo "说明: 当前仓库可能只有样板和模板，尚无具体目标项目。"
  echo "[OK] 跳过目标项目门禁。"
  exit 0
fi

fail_count=0

for target in "${targets[@]}"; do
  echo ""
  echo "============================================================"
  echo "[AI Guard] 目标项目: $target"
  echo "============================================================"
  if bash "$SCRIPT_DIR/check-ai-guard.sh" "$target"; then
    echo "[OK] 目标项目门禁通过: $target"
  else
    echo "[FAIL] 目标项目门禁失败: $target"
    fail_count=$((fail_count + 1))
  fi
done

if [[ "$fail_count" -gt 0 ]]; then
  echo ""
  echo "[FAIL] AI 门禁总检查未通过，共 $fail_count 个目标项目失败。"
  exit 1
fi

echo ""
echo "[OK] 所有目标项目 AI 门禁通过。"
