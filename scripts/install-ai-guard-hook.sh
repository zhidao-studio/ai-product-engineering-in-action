#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"

if [[ -z "$REPO_ROOT" ]]; then
  echo "[FAIL] 当前目录不在 Git 仓库内，无法安装 pre-commit hook。"
  exit 1
fi

HOOK_DIR="$REPO_ROOT/.git/hooks"
HOOK_FILE="$HOOK_DIR/pre-commit"

mkdir -p "$HOOK_DIR"

if [[ -f "$HOOK_FILE" ]]; then
  backup_file="$HOOK_FILE.ai-guard-backup.$(date +%Y%m%d%H%M%S)"
  cp "$HOOK_FILE" "$backup_file"
  echo "[AI Guard] 已备份已有 pre-commit hook: $backup_file"
fi

cat > "$HOOK_FILE" <<'HOOK'
#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

echo "[AI Guard] pre-commit 门禁开始"

bash scripts/run-ai-guard-all.sh

echo "[AI Guard] pre-commit 门禁通过"
HOOK

chmod +x "$HOOK_FILE"

echo "[OK] AI Guard pre-commit hook 已安装: $HOOK_FILE"
echo "说明: 以后执行 git commit 前会自动运行 bash scripts/run-ai-guard-all.sh"
