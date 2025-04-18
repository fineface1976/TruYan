// SPDX-License-Identifier: MIT  
     pragma solidity ^0.8.0;  

     import "@openzeppelin/contracts/token/ERC20/ERC20.sol";  

     contract TYAN is ERC20 {  
         address public owner;  
         uint256 public taxRate = 5; // 5% tax for liquidity & burns  

         constructor() ERC20("TruYan", "TYAN") {  
             owner = msg.sender;  
             _mint(owner, 200_000_000 * 10**18);  
         }  

         function _transfer(address sender, address recipient, uint256 amount) internal override {  
             uint256 tax = (amount * taxRate) / 100;  
             super._transfer(sender, 0x000000000000000000000000000000000000dEaD, tax / 2); // Burn 2.5%  
             super._transfer(sender, owner, tax / 2); // Liquidity 2.5%  
             super._transfer(sender, recipient, amount - tax);  
         }  
     }  
