# Liquid Staking Derivative (Lido-lite)

A professional-grade implementation for the "Proof of Stake" economy. This repository solves the capital inefficiency problem of traditional staking. Instead of locking tokens and losing liquidity, users mint "staked" versions of their assets. These tokens increase in value or quantity as the underlying nodes earn validation rewards.

## Core Features
* **stAsset Minting:** 1:1 issuance of receipt tokens upon deposit.
* **Reward Rebalancing:** Logic for updating the "Exchange Rate" or total supply based on validator performance.
* **Withdrawal Queue:** Orderly exit mechanism to handle unbonding periods from the consensus layer.
* **Flat Architecture:** Single-directory layout for the Staking Pool, Receipt Token, and Node Operator registry.

## Workflow
1. **Stake:** User deposits 1 ETH into the pool.
2. **Mint:** The contract mints 1 `stETH` to the user.
3. **Validate:** The pool delegates the ETH to a validator.
4. **Accrue:** Rewards are added to the pool, increasing the value of `stETH` relative to ETH.
5. **Exit:** User requests withdrawal; after the unbonding period, they receive their ETH + rewards.

## Setup
1. `npm install`
2. Deploy `StakingPool.sol` and `stETH.sol`.
