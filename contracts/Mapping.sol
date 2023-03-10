// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Mapping {
    struct student {
        string name;
        string subject;
        uint256 marks;
    }

    mapping (address => student) result;
    
}