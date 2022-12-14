import { ethers } from "hardhat";
import { Incrementor__factory } from "../typechain-types";

const main = async () => {
  const [signer] = await ethers.getSigners();

  const incrementor = await (
    await new Incrementor__factory(signer).deploy()
  ).deployed();

  console.log(incrementor.address);
};

main();
