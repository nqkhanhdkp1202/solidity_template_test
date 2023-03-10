// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract SendEther {

    constructor() payable{}
    
    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent,"Send failed");
    }

    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 123}(" ");
        require(success,"call failed");
    }
}

contract EthReceiver {
    event Log(uint amount,uint gas);

    receive() external payable {
        emit Log(msg.value,gasleft());
    }
}