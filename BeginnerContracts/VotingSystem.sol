// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract VotingSystem {
    // Voter struct
    struct Voter {
        bool voted;
    }

    // Mapping to store vote counts for each candidate
    mapping(string => uint256) public nameToVoteCount;

    // Mapping to track if an address has voted
    mapping(address => Voter) public voters;

    // Function to cast a vote
    function castVote(string memory _name) public {
        // Ensure the voter has not already voted
        require(!voters[msg.sender].voted, "You have already voted!");

        // Mark the voter as having voted
        voters[msg.sender].voted = true;

        // Increment the candidate's vote count
        nameToVoteCount[_name]++;
    }
}
