# ZeroTrust Framework

A production-ready, generic **zero-trust cryptographic protocol framework** for building verifiable peer-to-peer applications. The framework provides complete cryptographic guarantees without requiring trust in any participant.

## 🎯 What Is This?

A complete framework providing:
- **Zero-knowledge proofs** - Prove facts without revealing data (Merkle trees)
- **Digital signatures** - Authenticate all actions (ECDSA)
- **Synchronized blockchain** - Immutable shared history
- **Cheat detection** - Detect & invalidate cheaters
- **Commitment schemes** - Cryptographically bind to state
- **Complete verification** - Anyone can independently audit
- **Protocol enforcement** - Automatic timeout and turn order enforcement
- **State persistence** - Save/load protocol state
- **Reconnection handling** - Automatic state recovery

### Zero-Trust Properties

- ✅ **No trust in opponent** - All claims cryptographically verified
- ✅ **No trust in network** - All messages digitally signed
- ✅ **No central authority** - Pure P2P, fully decentralized
- ✅ **Zero-knowledge** - Reveal only what's necessary
- ✅ **Independently verifiable** - Third-party auditing possible
- ✅ **Cheat detection** - Cheaters automatically invalidated with proof

## 🚀 Quick Start

### Installation

```bash
# From source (development)
git clone https://github.com/Silenttttttt/zerotrust
cd zerotrust-framework
pip install -e .

# Or install from PyPI (when published)
pip install zerotrust-framework
```

### Basic Usage

```python
from zerotrust import ZeroTrustProtocol

# Initialize protocol with your commitment data
protocol = ZeroTrustProtocol(
    my_commitment_data=your_data,
    enable_enforcement=True,
    enable_persistence=True
)

# Get your commitment to share with opponent
commitment_data = protocol.get_my_commitment()

# Set opponent's commitment
protocol.set_opponent_commitment(opponent_commitment)

# Record an action (automatically signed)
success, action_data, signature = protocol.record_my_action(
    action_type="your_action",
    data={"key": "value"}
)

# Verify opponent's action
result = protocol.verify_opponent_action(action_data, signature)
if result.valid:
    print("Action verified!")

# Generate zero-knowledge proof
proof, proof_sig = protocol.generate_proof(
    commitment_obj=your_commitment,
    query=your_query
)

# Verify proof
is_valid = protocol.verify_proof(proof, proof_sig, committed_root)

# Check blockchain integrity
is_valid = protocol.verify_blockchain_integrity()
```

## 🏗️ Architecture

```
┌─────────────────────────────────────────┐
│         Your Application                │
│  (Games, Voting, Auctions, etc.)        │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│      ZeroTrustProtocol                   │
│  (Main Framework Class)                  │
└─────┬───────────┬───────────┬───────────┘
      │           │           │
┌─────▼───┐  ┌───▼────┐  ┌───▼──────┐
│Blockchain│  │Merkle  │  │Identity  │
│          │  │Proofs  │  │&Signatures│
└──────────┘  └────────┘  └──────────┘
```

## 📦 Core Components

### ZeroTrustProtocol

Main framework class - handles all cryptography:

```python
class ZeroTrustProtocol:
    def get_my_commitment() -> Dict              # Get commitment to share
    def set_opponent_commitment(commit) -> bool  # Verify opponent's commitment
    def record_my_action(type, data) -> tuple    # Sign and record action
    def verify_opponent_action(data, sig) -> bool # Verify signature
    def generate_proof(commitment, query) -> tuple # Generate ZK proof
    def verify_proof(proof, sig, root) -> bool    # Verify ZK proof
    def verify_blockchain_integrity() -> bool     # Verify chain
    def verify_all_signatures() -> bool           # Verify all sigs
    def replay_from_blockchain() -> bool          # Complete replay
```

### Commitment Schemes

Generic interface for commitments:

```python
from zerotrust import CommitmentScheme, GridCommitment

# Use built-in GridCommitment for grid-based apps
commitment = GridCommitment(grid_data, seed)
root = commitment.get_commitment_root()
proof = commitment.generate_proof(query)
```

### Blockchain

Immutable history ledger:

```python
from zerotrust import Blockchain, Transaction, MoveType

blockchain = Blockchain()
tx = Transaction(
    move_type=MoveType.ACTION,
    participant_id="alice",
    data={"action": "fire"},
    timestamp=time.time(),
    signature="..."
)
blockchain.add_transaction(tx)
blockchain.mine_block()
```

### Enforcement

Automatic protocol enforcement:

```python
protocol = ZeroTrustProtocol(
    my_commitment_data=data,
    enable_enforcement=True  # Enable automatic enforcement
)

# Timeouts are automatically detected
# Turn order is automatically enforced
# Violations are automatically handled
```

## 🔐 Security Features

- **ECDSA Signatures** - All actions cryptographically signed
- **Merkle Proofs** - Zero-knowledge proofs with full cryptographic paths
- **Blockchain Integrity** - Tamper-proof immutable ledger
- **Cheat Detection** - Comprehensive detection of all cheat types
- **Protocol Enforcement** - Automatic timeout and turn order enforcement
- **State Persistence** - Secure state save/load
- **Reconnection** - Automatic state recovery

## 📚 Examples

See the [p2p-battleship](https://github.com/Silenttttttt/crypto-battleship-p2p) repository for a complete example application using this framework.

## 🧪 Testing

```bash
# Run tests
pytest tests/

# With coverage
pytest --cov=zerotrust tests/
```

## 📄 License

MIT License - see LICENSE file for details.

## 🤝 Contributing

Contributions welcome! Please open an issue or submit a pull request.

## 🔗 Links

- **Documentation**: [Full API Documentation](https://github.com/Silenttttttt/zerotrust#readme)
- **Example Application**: [p2p-battleship](https://github.com/Silenttttttt/crypto-battleship-p2p)
- **Issues**: [GitHub Issues](https://github.com/Silenttttttt/zerotrust/issues)

