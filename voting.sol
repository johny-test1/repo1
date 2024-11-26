// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Declare mapping to track votes for each candidate
    mapping(string => uint256) public voteReceived;

    // Declare array to hold the list of candidates
    string[] public candidateList;

    // Declare mapping to track if an address has voted
    mapping(address => bool) public hasVoted;

    // Declare a public variable for contract owner
    address public owner;

    // Modifier to restrict access to owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Constructor to initialize the list of candidates and set the owner
    constructor(string[] memory candidateNames) {
        candidateList = candidateNames;
        owner = msg.sender; // Set the contract deployer as the owner
    }

    // Function to check total votes for a given candidate
    function totalVotesFor(string memory candidate) public view returns (uint256) {
        require(isValidCandidate(candidate), "Not a valid candidate");
        return voteReceived[candidate];
    }

    // Function to validate if a candidate is in the list
    function isValidCandidate(string memory candidate) public view returns (bool) {
        for (uint256 i = 0; i < candidateList.length; i++) {
            // Compare candidate name using keccak256 hash to handle string comparison
            if (keccak256(abi.encodePacked(candidateList[i])) == keccak256(abi.encodePacked(candidate))) {
                return true;
            }
        }
        return false;
    }

    // Function to allow a user to cast a vote for a valid candidate
    function castVoteFor(string memory candidate) public {
        require(!hasVoted[msg.sender], "You have already voted"); // Prevent double voting
        require(isValidCandidate(candidate), "Not a valid candidate");
        
        // Record that the user has voted
        hasVoted[msg.sender] = true;
        
        // Increment the vote count for the chosen candidate
        voteReceived[candidate] += 1;
    }

    // Function to add a new candidate (only owner can do this)
    function addCandidate(string memory newCandidate) public onlyOwner {
        candidateList.push(newCandidate);
    }

    // Function to get the list of candidates
    function getCandidates() public view returns (string[] memory) {
        return candidateList;
    }
}
