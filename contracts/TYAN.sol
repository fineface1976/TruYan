 function _distributeReferralRewards(address _user, uint256 _amount) internal {
    address currentReferrer = referrerOf[_user];
    uint256 remainingPercents = 50; // 20% + 10% + 10% + 10% + 10% = 60% (but capped at 50% for sustainability)
    
    for (uint256 i = 0; i < 5; i++) {
        if (currentReferrer == address(0) {
            // Spillover: Distribute remaining % to the platform reserve
            _transfer(owner, owner, (_amount * remainingPercents) / 100);
            break;
        }
        
        uint256 rewardPercent = i == 0 ? 20 : 10;
        if (rewardPercent > remainingPercents) rewardPercent = remainingPercents;
        
        _transfer(owner, currentReferrer, (_amount * rewardPercent) / 100);
        remainingPercents -= rewardPercent;
        
        currentReferrer = referrerOf[currentReferrer];
    }
}
