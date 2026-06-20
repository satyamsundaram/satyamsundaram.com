#!/bin/sh
# Regenerate syntax highlighting CSS from Rouge GitHub themes.
# Requires: gem install rouge  (provides rougify)
set -e

OUTPUT="assets/syntax.css"

{
  echo "/* Auto-generated — run: ./scripts/generate-syntax-css.sh */"
  echo
  rougify style github.light --scope '[data-theme="light"] .highlight'
  echo
  rougify style github.dark --scope '[data-theme="dark"] .highlight'
} > "$OUTPUT"

echo "Wrote $OUTPUT"
