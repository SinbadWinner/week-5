// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./composability/CallSPLTokenProgram.sol";

contract MySPLTokenExample is CallSPLTokenProgram {
    string public constant mintSeed = "week4_mint_seed";
    uint64 public constant mintAmount = 1_000_000;
    uint8 public constant decimals = 6;

    function executeAll(address user, address delegate, address newAuthority) external {
        this.createInitializeTokenMint(bytes(mintSeed), decimals);

        bytes32 mintAccount = this.getTokenMintAccount(address(this), bytes(mintSeed));
        bytes32 userPubkey = this.getNeonAddress(user);
        bytes32 delegatePubkey = this.getNeonAddress(delegate);

        this.createInitializeArbitraryTokenAccount(mintAccount, userPubkey, bytes32(0));
        bytes32 userATA = this.getArbitraryTokenAccount(mintAccount, userPubkey, 0);

        this.mint(bytes(mintSeed), userATA, mintAmount);
        this.approve(mintAccount, delegatePubkey, 200_000);

        this.createInitializeArbitraryTokenAccount(mintAccount, delegatePubkey, bytes32(0));
        bytes32 delegateATA = this.getArbitraryTokenAccount(mintAccount, delegatePubkey, 0);

        this.claim(userATA, delegateATA, 150_000);
        this.burn(mintAccount, 100_000);

        this.updateTokenMintAuthority(
            bytes(mintSeed),
            LibSPLTokenProgram.AuthorityType.MINT,
            this.getNeonAddress(newAuthority)
        );

        this.closeTokenAccount(mintAccount, userPubkey);
    }
}
