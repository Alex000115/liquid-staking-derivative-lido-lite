// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./stETH.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract StakingPool is ReentrancyGuard {
    stETH public immutable receiptToken;
    uint256 public totalPooledEther;

    event Staked(address indexed user, uint256 amount);
    event RewardsAdded(uint256 amount);

    constructor(address _receiptToken) {
        receiptToken = stETH(_receiptToken);
    }

    /**
     * @dev User deposits ETH and receives stETH 1:1.
     */
    function stake() external payable nonReentrant {
        require(msg.value > 0, "Cannot stake 0");
        
        uint256 sharesToMint = msg.value; // Initial 1:1 ratio
        totalPooledEther += msg.value;
        
        receiptToken.mint(msg.sender, sharesToMint);
        emit Staked(msg.sender, msg.value);
    }

    /**
     * @dev Simulates the addition of rewards from validator nodes.
     * In production, this would be triggered by an Oracle or Consensus layer bridge.
     */
    function distributeRewards() external payable {
        totalPooledEther += msg.value;
        emit RewardsAdded(msg.value);
    }

    function getExchangeRate() public view returns (uint256) {
        if (receiptToken.totalSupply() == 0) return 1e18;
        return (totalPooledEther * 1e18) / receiptToken.totalSupply();
    }
}
