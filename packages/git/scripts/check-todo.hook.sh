#!/bin/bash

echo "🔍 Checking for TODO/FIXME/XXX in staged files..."
matches=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(js|ts|go|py|sh|lua|md)$' | xargs grep -En 'TODO:|FIXME:|XXX:' || true)

if [[ -n "$matches" ]]; then
  echo "⚠️  Found comments in staged files:"
  echo "$matches"
  echo "✅ Commit allowed, but consider addressing the above."
fi
