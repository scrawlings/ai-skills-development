#!/usr/bin/env bash
# canon-check/scripts/check.sh — verify every canon ref in a file resolves.
# Usage: check.sh <passage.md>
#   FICTION_ROOT=/path check.sh <passage.md>   (override the fiction root)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FICTION_ROOT="${FICTION_ROOT:-$(cd "$SCRIPT_DIR/../../../../" && pwd)}"

passage="${1:?usage: check.sh <passage.md>}"

slugify() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//'
}

# Collect every canon ref (frontmatter refs: list or inline [[canon/...]]).
refs="$(grep -oE 'canon/[A-Za-z0-9_-]+#[A-Za-z0-9_-]+' "$passage" | sort -u || true)"

if [ -z "$refs" ]; then
  echo "No canon refs found in: $passage"
  exit 0
fi

fail=0
while IFS= read -r ref; do
  [ -z "$ref" ] && continue
  file="${ref%%#*}"        # canon/magic-system
  anchor="${ref##*#}"      # mana-cost
  path="$FICTION_ROOT/world/$file.md"
  if [ ! -f "$path" ]; then
    echo "MISSING FILE: $ref  ->  $path"
    fail=1
    continue
  fi
  found=0
  while IFS= read -r heading; do
    [ "$(slugify "$heading")" = "$anchor" ] && { found=1; break; }
  done < <(grep -oE '^#{1,6} .+' "$path" | sed -E 's/^#{1,6} //')
  if [ "$found" -eq 1 ]; then
    echo "OK: $ref"
  else
    echo "MISSING ANCHOR: $ref (no heading with slug '$anchor' in $path)"
    fail=1
  fi
done <<< "$refs"

exit $fail
