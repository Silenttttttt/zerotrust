#!/bin/bash
set -e

cd /home/silent/Documents/Computarias/zerotrust

echo "🚀 Pushing ZeroTrust Framework to GitHub..."
echo ""

# Initialize git if needed
if [ ! -d .git ]; then
    echo "📦 Initializing git..."
    git init
fi

# Add all files
echo "📝 Adding files..."
git add .

# Commit
echo "💾 Committing..."
git commit -m "Initial commit: ZeroTrust Framework v0.1.0" || echo "Already committed"

# Set branch
echo "🌿 Setting branch to main..."
git branch -M main

# Add remote
echo "🔗 Setting remote..."
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/Silenttttttt/zerotrust.git

# Push
echo "📤 Pushing to GitHub..."
echo ""
git push -u origin main

echo ""
echo "✅ Done! Repository pushed to https://github.com/Silenttttttt/zerotrust"

