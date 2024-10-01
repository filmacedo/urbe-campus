// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Assignemnt Implement a basic voting system where users can vote for candidates, and the owner can declare the winner.
// Implement a voting system where users can vote for a candidate.
// The contract owner can declare the winner based on the votes.
// at the end, you need to vote for real, on testnet

contract SimpleVoting {

    address public owner; // address of the contract owner
    address[] public candidates; // array with all the candidate's addresses
    address public winner; // store the winner's address
    bool public isVotingEnded; // Flag to indicate if voting has ended



    // events to emit each time a candidate is added, a vote is cast or the winner is declared
    event CandidateAdded(string indexed message, address indexed candidate);
    event NewVote(string indexed message, address indexed vote);
    event WinnerDeclared(address indexed winner, uint votes); 


    // initialize contract and owner of the contract
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    // a mapping for votes, using the candidate name as the key
    mapping(address => uint) public votes;

    // a mapping to keep track of whether an address has voted
    mapping(address => bool) public hasVoted;

    // a mapping to check if an address is already a candidate
    mapping(address => bool) public isCandidate;


    // function to populate the array of candidates 
    function addCandidate(address newCandidate) public onlyOwner {
        
        // Check for duplicates
        require(!isCandidate[newCandidate], "Candidate already exists"); 
        
        // using .push() to add a new candidate address to the array
        candidates.push(newCandidate);

        // Mark this address as a candidate
        isCandidate[newCandidate] = true; 

        // Emit event when a candidate is added
        emit CandidateAdded("New Candidate", newCandidate);
    }

    // function to vote on a candidate
    function newVote(address candidateVote) public {

        require(candidates.length != 0, "No candidates yet");
        require(!hasVoted[msg.sender], "You have already voted");

        for (uint i = 0; i < candidates.length; i++) {
            
            if(candidates[i] == candidateVote){
                
                // Increment the voting count
                votes[candidates[i]] = votes[candidates[i]] + 1;

                // Mark sender as having voted
                hasVoted[msg.sender] = true; 

                // Emit event when a new vote is made
                emit NewVote("New vote added", candidateVote);
                
                // exit the if condition after finding the candidate
                break;
            }
            else{
                // Emit event when a new vote is made
                emit NewVote("Address didn't match a candidate", candidateVote);
            }
        }
    }

    // function to end the vote and declare the winner, only by contract owner
    function endVote() public onlyOwner returns(address){
        
        require(candidates.length != 0, "No candidates yet");

        address currentWinner;
        uint maxVotes = 0;

        // Find the candidate with the highest votes
        for (uint i = 0; i < candidates.length; i++) {
            if(votes[candidates[i]] > maxVotes){
                
                // when we find a candidate with more votes, update the maxVotes temp variable
                maxVotes = votes[candidates[i]];

                // update the address of the winner
                currentWinner = candidates[i];
            }

            winner = currentWinner; // Set the final winner
            isVotingEnded = true; // Mark voting as ended

            // Emit event when the winner is declared
            emit WinnerDeclared(currentWinner, maxVotes);
            
        }

        return winner;
    }
}
