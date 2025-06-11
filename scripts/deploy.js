const hre = require("hardhat");

async function main() {
  const [deployer, user1, user2] = await hre.ethers.getSigners();
  console.log("Deploying with:", deployer.address);

  const ContractFactory = await hre.ethers.getContractFactory("MySPLTokenExample");
  const contract = await ContractFactory.deploy();
  await contract.waitForDeployment();

  const contractAddress = await contract.getAddress();
  console.log("Contract deployed to:", contractAddress);

  const user = user1.address;
  const delegate = user2.address;
  const newAuthority = deployer.address;

  try {
    const tx = await contract.executeAll(user, delegate, newAuthority);
    console.log("executeAll() sent:", tx.hash);
    await tx.wait();
    console.log("✅ All actions executed");
  } catch (error) {
    console.error("❌ Ошибка во время executeAll:", error.message || error);
  }
}

main().catch((error) => {
  console.error("❌ Script failed:", error.message || error);
  process.exitCode = 1;
});
