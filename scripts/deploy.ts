import { ethers } from "hardhat";

async function main() {
  // Get the contract factory for SimpleProposal
  const SimpleProposal = await ethers.getContractFactory("SimpleProposal");

  // Deploy the contract
  const simpleProposal = await SimpleProposal.deploy();

  // Wait for the deployment to be mined
  await simpleProposal.waitForDeployment();

  // Log the deployed contract address
  console.log("SimpleProposal contract deployed to:", simpleProposal.target);
}

// Main function execution
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
