#!/usr/bin/env bash
# Local verification: formatting, sourcemap, and strict type check.
# Run from anywhere:  bash scripts/verify.sh
# Requires the tools pinned in rokit.toml (run `rokit install` first).
set -euo pipefail
cd "$(dirname "$0")/.."

LUAU_LSP_VERSION="1.70.1" # keep in sync with rokit.toml
TYPES_DIR=".cache"
TYPES_FILE="$TYPES_DIR/globalTypes.d.luau"
TYPES_URL="https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/${LUAU_LSP_VERSION}/scripts/globalTypes.d.luau"

for tool in rojo stylua luau-lsp; do
	command -v "$tool" >/dev/null || { echo "Missing '$tool'. Run: rokit install"; exit 1; }
done

if [ ! -f "$TYPES_FILE" ]; then
	echo "Downloading Roblox type definitions (luau-lsp $LUAU_LSP_VERSION)..."
	mkdir -p "$TYPES_DIR"
	curl -fsSL "$TYPES_URL" -o "$TYPES_FILE"
fi

echo "1/3 Generating sourcemap..."
rojo sourcemap default.project.json -o sourcemap.json

echo "2/3 Checking formatting (StyLua)..."
stylua --check src tests

echo "3/3 Type checking (luau-lsp analyze)..."
luau-lsp analyze \
	--sourcemap=sourcemap.json \
	--definitions="$TYPES_FILE" \
	--base-luaurc=.luaurc \
	src tests

echo "OK: verification passed."
