require("@nomicfoundation/hardhat-toolbox");
require('@openzeppelin/hardhat-upgrades');
require('solidity-docgen');
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    compilers: [
      {
        version: '0.8.28',
        settings: {
          evmVersion: "cancun",
          optimizer: {
            enabled: true,
            runs: 200,
          },
          viaIR: true, // ✅ ← вот сюда надо
        },
      },
    ],
  },
  docgen: {
    path: './docs',
    pages: 'files',
    clear: true,
    runOnCompile: true
  },
  etherscan: {
    apiKey: {
      neonevm: "test",
    },
    customChains: [
      {
        network: "neonevm",
        chainId: 245022926,
        urls: {
          apiURL: "https://devnet-api.neonscan.org/hardhat/verify",
          browserURL: "https://devnet.neonscan.org",
        },
      },
      {
        network: "neonevm",
        chainId: 245022934,
        urls: {
          apiURL: "https://api.neonscan.org/hardhat/verify",
          browserURL: "https://neonscan.org",
        },
      },
    ],
  },
  networks: {
    neondevnet: {
      url: "https://devnet.neonevm.org",
      accounts: [
        process.env.PRIVATE_KEY_OWNER,
        process.env.USER1_KEY,
        process.env.USER2_KEY,
        process.env.USER3_KEY
      ],
      chainId: 245022926,
      allowUnlimitedContractSize: false,
      gasMultiplier: 2,
      maxFeePerGas: '10000000000000',
      maxPriorityFeePerGas: '5000000000000'
    },
    neonmainnet: {
      url: "https://neon-proxy-mainnet.solana.p2p.org",
      accounts: [
        process.env.PRIVATE_KEY_OWNER,
        process.env.USER1_KEY,
        process.env.USER2_KEY,
        process.env.USER3_KEY
      ],
      chainId: 245022934,
      allowUnlimitedContractSize: false,
      gas: "auto",
      gasPrice: "auto",
    },
    curvestand: {
      url: process.env.EVM_NODE,
      accounts: [
        process.env.PRIVATE_KEY_OWNER,
        process.env.USER1_KEY,
        process.env.USER2_KEY,
        process.env.USER3_KEY
      ],
      allowUnlimitedContractSize: false,
      gasMultiplier: 2,
      maxFeePerGas: 10000,
      maxPriorityFeePerGas: 5000
    },
  },
  mocha: {
    timeout: 2800000
  }
};
