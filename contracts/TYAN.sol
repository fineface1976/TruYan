 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TYAN is ERC20 {
    address public admin;
    mapping(address => bool) public registeredUsers;

    constructor() ERC20("TruYan", "TYAN") {
        admin = msg.sender;
        _mint(admin, 200_000_000 * 10**18); // Admin holds all tokens initially
    }

    // Register users and send 100 TYAN
    function register() external {
        require(!registeredUsers[msg.sender], "Already registered");
        registeredUsers[msg.sender] = true;
        _transfer(admin, msg.sender, 100 * 10**18);
    }

    // Link external wallets (e.g., MetaMask)
    function linkWallet(address externalWallet) external {
        require(registeredUsers[msg.sender], "Register first");
        _transfer(msg.sender, externalWallet, balanceOf(msg.sender));
    }
}
