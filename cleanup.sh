#!/bin/bash

# ── Remove .ipynb_checkpoints and ignore forever ───────────────────────────

echo "🧹 Clearing cache..."
git rm -r --cached .ipynb_checkpoints/ 2>/dev/null
git rm -r --cached **/.ipynb_checkpoints/ 2>/dev/null

echo "📝 Updating .gitignore..."
if ! grep -q ".ipynb_checkpoints" .gitignore 2>/dev/null; then
    echo "**/.ipynb_checkpoints/" >> .gitignore
    echo "✅ Added to .gitignore"
else
    echo "✅ Already in .gitignore"
fi

echo "📦 Committing..."
git add .gitignore
git commit -m "Ignore checkpoints forever"

echo "🚀 Pushing..."
git push

echo ""
echo "🎉 Done! .ipynb_checkpoints will never be tracked again."