// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract SimpleProposal {
    struct Proposal {
        string description;
        uint256 voteCount;
    }

    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;

    // Event emitted when a new proposal is created
    event ProposalCreated(uint256 proposalId, string description);
    
    // Event emitted when a vote is cast
    event Voted(uint256 proposalId, address voter);

    // Function to create a new proposal
    function createProposal(string memory description) public {
        proposals.push(Proposal({
            description: description,
            voteCount: 0
        }));
        emit ProposalCreated(proposals.length - 1, description);
    }

    // Function to vote on a proposal
    function vote(uint256 proposalId) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(proposalId < proposals.length, "Proposal does not exist.");

        proposals[proposalId].voteCount += 1;
        hasVoted[msg.sender] = true;

        emit Voted(proposalId, msg.sender);
    }

    // Function to get the total number of proposals
    function getProposalsCount() public view returns (uint256) {
        return proposals.length;
    }

    // Function to get the details of a proposal
    function getProposal(uint256 proposalId) public view returns (string memory, uint256) {
        require(proposalId < proposals.length, "Proposal does not exist.");
        Proposal memory proposal = proposals[proposalId];
        return (proposal.description, proposal.voteCount);
    }
}
