// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract piggyBank{

    address public owner;

    constructor() {         // constructor for sender
        owner=msg.sender;
    }

    function deposit() public payable {    // function to deposit ETH 
        require(msg.value>0,"Send Some ETH");
    }

    function withdraw() public{      // function to withdraw all money
        require(msg.sender==owner,"Not Valid");
        payable(owner).transfer(address(this).balance);
    }

/*  function withdraw() public {
        require(msg.sender == owner, "Not owner");

        uint256 balance = address(this).balance;

        (bool success, ) = payable(owner).call{value: balance}("");
        require(success, "ETH transfer failed");
    }
*/
    function getBalance() public view returns(uint256){   // function to get balance
        return address(this).balance;
    }

}