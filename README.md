 Contract Address  
**0xFB16Eeeb96F26182F305d4A7269D002459b54b0b**

##Deployed Smart Contract Details

This smart contract is deployed on the **Sepolia Test Network**.

You can interact with the contract using the following tabs on Etherscan:

- **Read Contract** → View election status, candidates, total votes, winner
- **Write Contract** → Create election, vote, end election  
  (requires connecting MetaMask to Sepolia)

Make sure your MetaMask is set to **Sepolia Testnet** and has test ETH before executing write functions.
##  How It Works

### 1. Create Election
Only the owner of the contract can start a new election by providing a list of candidate names.

### 2. Voting
- Each wallet address can vote **only once**
- Voters choose a candidate by index (0, 1, 2...)
- Votes are counted immediately
- Voting only works if the election is active

### 3. End Election
Only the owner can end the election to stop voting.

### 4. Get Results
Anyone can call:
- `getResults()` – shows all candidates and vote counts
- `getWinner()` – returns the name and votes of the winning candidate

## Testing Checklist

*Can I create an election?
*Can multiple people vote?
*Does voting reject double-voting?
*Does voting stop after ending the election?

## Repository Contents
- `SimpleVoting.sol` – full smart contract code
- `LICENSE` – MIT License
- `.gitignore` – ignores unnecessary files
- `README.md` – project documentation

## Tools Used
- Solidity 0.8.20
- Remix IDE
- MetaMask
- Sepolia Testnet
- Etherscan Verification


##Election Setup and Results

The deployed voting contract uses three candidates:
Candidate
Index
APC 0
LP 1
PDP 2

##How Voting Works

To cast vote, call the vote
(candidateIndex)
Eg. // Vote for APC
vote(0);

// Vote for LP
vote(1);

// Vote for PDP
vote(2);

##How to Check Results

To retrieve candidate information (name + vote count),call:
getCandidate(index)

Eg .getCandidate(0) → Returns APC name + vote count

•	getCandidate(1) → Returns LP name + vote count

•	getCandidate(2) → Returns PDP name + vote count



##SUMMARY

This project demonstrates a simple decentralized voting smart contract deployed on the Ethereum Sepolia test network. It allows users to cast votes for predefined candidates, ensures each address can only vote once, and provides transparent retrieval of vote counts directly from the blockchain.

##GitHub Repository

https://github.com/chinwenduanyanwu01/Simple-voting-contract.git

##Deployed Contract Address
0xFB16Eeeb96F26182F305d4A7269D002459b54b0b


