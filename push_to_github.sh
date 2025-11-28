#!/bin/bash
# Push ZeroTrust Framework to GitHub

cd /home/silent/Documents/Computarias/zerotrust

echo "📦 Initializing git repository..."
git init

echo "📝 Adding all files..."
git add .

echo "💾 Creating initial commit..."
git commit -m "Initial commit: ZeroTrust Framework v0.1.0

- Complete zero-trust protocol framework
- Merkle tree commitments and zero-knowledge proofs
- Synchronized blockchain with integrity verification
- Digital signatures (ECDSA)
- Cheat detection and invalidation
- Protocol enforcement (timeouts, turn order)
- State persistence and reconnection handling
- Production-ready and fully tested"

echo "🌿 Setting main branch..."
git branch -M main

echo "🔗 Adding remote repository..."
git remote remove origin 2>/dev/null
git remote add origin https://github.com/Silenttttttt/zerotrust.git

echo "📤 Pushing to GitHub..."
git push -u origin main

echo "✅ Done! Repository pushed to https://github.com/Silenttttttt/zerotrust"

