import { ethers } from "hardhat";
import { AutomationCompatibleIncrementorRepeater__factory } from "../typechain-types";

const incrementorAddress = "";

const main = async () => {
  const [signer] = await ethers.getSigners();

  const automationCompatibleIncrementorRepeater = await (
    await new AutomationCompatibleIncrementorRepeater__factory(signer).deploy(
      incrementorAddress
    )
  ).deployed();

  console.log(automationCompatibleIncrementorRepeater.address);
};

main();
