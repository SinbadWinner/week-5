// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./libs/raydium-program/LibRaydiumInstructions.sol";

contract MyRaydiumExample {
    function getSwapInputInstruction() external pure returns (bytes memory) {
        // Пример poolId (замени позже)
        bytes32 poolId = 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;
        uint64 amountIn = 1_000_000;
        bool baseIn = true;
        uint16 slippage = 100;
        bool returnData = false;
        bytes32 ;

        return LibRaydiumInstructions.swapInputInstruction(
            poolId,
            amountIn,
            baseIn,
            slippage,
            returnData,
            premadeAccounts
        );
    }
}

