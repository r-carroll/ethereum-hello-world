// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Voter {
    uint[] public votes;
    string[] public options;

    constructor(string[] memory _options) {
        options = _options;
        for (uint i = 0; i < options.length; i++) {
            votes.push(0);
        }
    }

    function vote(uint option) public {
        require(0 <= option && option < options.length, "Ivalid option");
        votes[option] = votes[option] + 1;
    }

    function getOptions() public view returns (string[] memory) {
        return options;
    }

    function getVotes() public view returns (uint[] memory) {
        return votes;
    }
}