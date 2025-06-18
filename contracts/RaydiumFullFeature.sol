// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./libs/raydium-program/LibRaydiumInstructions.sol";

contract RaydiumLiquidityAndSwap {
    function buildCreatePool(
        bytes32 tokenA,
        bytes32 tokenB,
        uint64 amountA,
        uint64 amountB,
        uint64 startTime,
        uint16 configIndex,
        bytes32[] memory premadeAccounts
    ) external pure returns (bytes memory) {
        return LibRaydiumInstructions.createPoolInstruction(
            tokenA,
            tokenB,
            amountA,
            amountB,
            startTime,
            configIndex,
            false,
            premadeAccounts
        );
    }

    function buildAddLiquidity(
        bytes32 poolId,
        uint64 amount,
        bool baseIn,
        uint16 slippage,
        bytes32[] memory premadeAccounts
    ) external pure returns (bytes memory) {
        return LibRaydiumInstructions.addLiquidityInstruction(
            poolId,
            amount,
            baseIn,
            slippage,
            false,
            premadeAccounts
        );
    }

    function buildWithdrawLiquidity(
        bytes32 poolId,
        uint64 lpAmount,
        uint16 slippage,
        bytes32[] memory premadeAccounts
    ) external pure returns (bytes memory) {
        return LibRaydiumInstructions.withdrawLiquidityInstruction(
            poolId,
            lpAmount,
            slippage,
            true,
            premadeAccounts
        );
    }

    function buildLockLiquidity(
        bytes32 poolId,
        uint64 lpAmount,
        bool withMetadata,
        bytes32 salt,
        bytes32[] memory premadeAccounts
    ) external pure returns (bytes memory) {
        return LibRaydiumInstructions.lockLiquidityInstruction(
            poolId,
            lpAmount,
            withMetadata,
            salt,
            false,
            premadeAccounts
        );
    }

    function buildCollectFees(
        bytes32 poolId,
        uint64 lpFeeAmount,
        bytes32 salt,
        bytes32[] memory premadeAccounts
    ) external pure returns (bytes memory) {
        return LibRaydiumInstructions.collectFeesInstruction(
            poolId,
            lpFeeAmount,
            salt,
            false,
            premadeAccounts
        );
    }

    function buildSwap(
        bytes32 poolId,
        uint64 amountIn,
        bool baseIn,
        uint16 slippage,
        bytes32[] memory premadeAccounts
    ) external pure returns (bytes memory) {
        return LibRaydiumInstructions.swapInputInstruction(
            poolId,
            amountIn,
            baseIn,
            slippage,
            false,
            premadeAccounts
        );
    }

    function buildSwapOutput(
        bytes32 poolId,
        bytes32 inputToken,
        uint64 amountOut,
        uint16 slippage,
        bytes32[] memory premadeAccounts
    ) external pure returns (bytes memory) {
        return LibRaydiumInstructions.swapOutputInstruction(
            poolId,
            inputToken,
            amountOut,
            slippage,
            false,
            premadeAccounts
        );
    }
}
