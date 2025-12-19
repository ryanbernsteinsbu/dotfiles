#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/.dotfiles/nixos"
LOG="$REPO/nixos-switch.log"

pushd "$REPO" >/dev/null

nvim .
git diff -U0 '*.nix'

echo "Rebuilding NixOS…"

if ! sudo nixos-rebuild switch &>"$LOG"; then
  grep --color=auto error "$LOG"
  exit 1
fi

popd >/dev/null
