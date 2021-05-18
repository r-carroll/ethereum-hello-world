// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Voter {
    struct OptionPos {
        uint position;
        bool exists;
    }
    
    uint[] public votes;
    string[] public options;
    mapping (address => bool) hasVoted;
    mapping (string => OptionPos) posOfOption;

    constructor(string[] memory _options) {
        options = _options;
        for (uint i = 0; i < options.length; i++) {
            votes.push(0);
            OptionPos memory optionPos = OptionPos(i, true);
            string memory optionName = options[i];
            posOfOption[optionName] = optionPos;
        }
    }

    function vote(uint option) public {
        require(0 <= option && option < options.length, "Ivalid option");
        require(!hasVoted[msg.sender], "Account has already voted"); 
        votes[option] = votes[option] + 1;
        hasVoted[msg.sender] = true;
    }
    
    function vote(string memory optionName) public {
        require(!hasVoted[msg.sender], "Account has already voted"); 
        
        OptionPos memory optionPos = posOfOption[optionName];
        require(optionPos.exists, "Option does not exist");
        votes[optionPos.position] = votes[optionPos.position] + 1;
        hasVoted[msg.sender] = true;
    }

    function getOptions() public view returns (string[] memory) {
        return options;
    }

    function getVotes() public view returns (uint[] memory) {
        return votes;
    }
}