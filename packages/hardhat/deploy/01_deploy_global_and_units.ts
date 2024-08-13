import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const name = "UnitsAndGlobalStuffSandbox";

const deployFunction: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  await deploy(name, {
    from: deployer,
    args: [deployer],
    log: true,
    autoMine: true,
  });
};

export default deployFunction;

deployFunction.tags = [name, "sbx"];
