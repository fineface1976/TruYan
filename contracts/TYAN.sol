// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TYAN is ERC20 {
    address public owner;
    uint256 public taxRate = 5; // 5% tax
    mapping(address => address) public referrerOf; // Tracks who referred a user
    mapping(address => uint256[]) public downline; // Tracks each user’s downline

    // Reward percentages: Level 1 (20%), Levels 2-5 (10% each)
    uint256[5] public referralPercents = [20, 10, 10, 10, 10]; 

    constructor() ERC20("TruYan", "TYAN") {
        owner = msg.sender;
        _mint(owner, 200_000_000 * 10**18);
    }

    // Set referrer when a user joins
    function setReferrer(address _user, address _referrer) external {
        require(referrerOf[_user] == address(0), "Referrer already set");
        referrerOf[_user] = _referrer;
        downline[_referrer].push(_user);
    }

    // Distribute rewards across 5 levels
    function _distributeReferralRewards(address _user, uint256 _amount) internal {
        address currentReferrer = referrerOf[_user];
        for (uint256 i = 0; i < 5; i++) {
            if (currentReferrer == address(0)) break;
            uint256 reward = (_amount * referralPercents[i]) / 100;
            _transfer(owner, currentReferrer, reward);
            currentReferrer = referrerOf[currentReferrer];
        }
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 tax = (amount * taxRate) / 100;
        super._transfer(sender, 0x000000000000000000000000000000000000dEaD, tax / 2); // Burn 2.5%
        super._transfer(sender, owner, tax / 2); // Liquidity 2.5%
        super._transfer(sender, recipient, amount - tax);

        if (sender != owner) { // Skip referral rewards for owner/initial mint
            _distributeReferralRewards(recipient, amount);
        }
    }
}
