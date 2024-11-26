// const ChildData = artifacts.require("ChildData");

// module.exports = async function (deployer) {
//   try {
//     console.log("Starting deployment...");
//     await deployer.deploy(ChildData);
//     const instance = await ChildData.deployed();
//     console.log("ChildData deployed at:", instance.address);
//   } catch (error) {
//     console.error("Deployment failed:", error);
//   }
// };
const SimpleContract = artifacts.require("SimpleContract");

module.exports = async function (deployer) {
  try {
    console.log("Deploying SimpleContract...");
    await deployer.deploy(SimpleContract);
    const instance = await SimpleContract.deployed();
    console.log("SimpleContract deployed at:", instance.address);
  } catch (error) {
    console.error("Deployment failed:", error);
  }
};
