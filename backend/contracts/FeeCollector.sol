// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        balance += msg.value;
    }

    function withdraw(uint amount, address destAdrr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");
        destAdrr.transfer(amount);
        balance -= amount;
    }
}
