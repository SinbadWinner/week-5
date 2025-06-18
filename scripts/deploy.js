const hre = require("hardhat");

async function main() {
  // Загружаем контракт
  const Factory = await hre.ethers.getContractFactory("RaydiumFullFeature");

  // Деплой
  const contract = await Factory.deploy();
  await contract.deployed();

  console.log("Контракт задеплоен по адресу:", contract.address);
}

main().catch((error) => {
  console.error("Ошибка при деплое:", error);
  process.exitCode = 1;
});
