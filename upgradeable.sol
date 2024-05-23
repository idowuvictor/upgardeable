// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// NOTE: Deploy this contract first
contract main {
    // NOTE: storage layout must be the same as contract oneCall
    string public name;
    address public sender;

    function setname(string  memory _name) public {
        name = _name;
        sender = msg.sender;
    }
}

contract proxy {
    string public name;
    address public sender;

    function setname(address _contract, string memory _name) public {
    
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setname(string)", _name)
        );
    }
} 