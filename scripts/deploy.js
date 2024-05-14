const hre = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);
  const as4 = await hre.ethers.getContractFactory("DegenToken");
  const contract = await as4.deploy(
    "0x1939a017D5A94A69db7999aCBf37a14Fa3FC8e0B"
  );
  const address = await contract.getAddress();
  console.log(`Contract Address: ${address}`);
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
