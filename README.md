# Simple Voting Contract

A simple Ethereum voting smart contract deployed on the Sepolia test network.

## 📝 Contract Address
`0xFB16Eeeb96F26182F305d4A7269D002459b54b0b`

## 📌 How It Works

### 1. Create Election
Only the owner of the contract can start a new election by providing a list of candidate names.

### 2. Voting
- Each wallet address can vote **only once**
- Voters choose a candidate by index (0, 1, 2...)
- Votes are counted immediately
- Voting only works if the election is active

### 3. End Election
The owner can end the election to stop voting.

### 4. Get Results
Anyone can call:
- `getResults()` – shows all candidates and vote counts
- `getWinner()` – returns the name and votes of the winning candidate

## 🧪 Testing Checklist

- [x] Can I create an election?
- [x] Can multiple people vote?
- [x] Does voting reject double-voting?
- [x] Does voting stop after ending the election?

## 📂 Repository Contents
- `SimpleVoting.sol` – full smart contract code
- `LICENSE` – MIT License
- `.gitignore` – ignores unnecessary files
- `README.md` – project documentation

## 💻 Tools Used
- Solidity 0.8.20
- Remix IDE
- MetaMask
- Sepolia Testnet
- Etherscan Verification
