#!/bin/bash


git rm -r --cached .ipynb_checkpoints/
echo "**/.ipynb_checkpoints/" >> .gitignore
git add .gitignore
git commit -m "Ignore checkpoints forever"
git push

# ── Add, commit and push ───────────────────────────────────────────────────
# Usage: bash push.sh "your commit message"

MESSAGE=${1:-"Update files"}

echo "📦 Staging all changes..."
git add .

echo "✅ Committing: $MESSAGE"
git commit -m "$MESSAGE"

echo "🚀 Pushing..."
git push

echo ""
echo "🎉 Done!"