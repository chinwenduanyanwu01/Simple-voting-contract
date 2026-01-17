// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {
    address public owner;
    bool public electionActive;

    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;

    event ElectionCreated(uint256 candidateCount);
    event VoteCast(address indexed voter, uint256 candidateIndex);
    event ElectionEnded();

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    modifier electionIsActive() {
        require(electionActive, "Election is not active");
        _;
    }

    constructor() {
        owner = msg.sender;
        electionActive = false;
    }

    function createElection(string[] memory candidateNames) public onlyOwner {
        require(!electionActive, "An election is already active");
        require(candidateNames.length > 0, "Must have at least one candidate");

        delete candidates;

        for (uint256 i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({
                name: candidateNames[i],
                voteCount: 0
            }));
        }

        electionActive = true;
        emit ElectionCreated(candidateNames.length);
    }

    function vote(uint256 candidateIndex) public electionIsActive {
        require(!hasVoted[msg.sender], "You have already voted");
        require(candidateIndex < candidates.length, "Invalid candidate index");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;

        emit VoteCast(msg.sender, candidateIndex);
    }

    function endElection() public onlyOwner {
        electionActive = false;
        emit ElectionEnded();
    }

    function getResults() public view returns (Candidate[] memory) {
        Candidate[] memory _results = new Candidate[](candidates.length);
        for (uint i = 0; i < candidates.length; i++) {
            _results[i] = candidates[i];
        }
        return _results;
    }

    function getWinner() public view returns (string memory winnerName, uint256 winnerVoteCount) {
        require(candidates.length > 0, "No candidates in election");

        uint256 winningVoteCount = 0;
        uint256 winningIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winningVoteCount) {
                winningVoteCount = candidates[i].voteCount;
                winningIndex = i;
            }
        }

        return (candidates[winningIndex].name, winningVoteCount);
    }
}