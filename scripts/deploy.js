const hre = require("hardhat");

async function main() {
    const TaskTracker = await hre.ethers.getContractFactory("TaskTracker");
    const taskTracker = await TaskTracker.deploy();

    await taskTracker.waitForDeployment();

    console.log("TaskTracker deployed to:", await taskTracker.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});