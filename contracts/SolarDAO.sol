// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SolarDAO {
    struct Proposal {
        string description;
        uint256 votesFor;
        uint256 votesAgainst;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    function createProposal(string calldata _description) external {
        proposals.push(Proposal({
            description: _description,
            votesFor: 0,
            votesAgainst: 0,
            executed: false
        }));
    }

    function vote(uint256 _proposalId, bool _support) external {
        require(!hasVoted[_proposalId][msg.sender], "Already voted");
        
        if (_support) {
            proposals[_proposalId].votesFor++;
        } else {
            proposals[_proposalId].votesAgainst++;
        }
        
        hasVoted[_proposalId][msg.sender] = true;
    }
}
