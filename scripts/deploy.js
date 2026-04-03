import hre from "hardhat";

async function main() {
  console.log("Memulakan Transmisi Kedaulatan ke Polygon...");
  const Token = await hre.ethers.getContractFactory("SovereignJadiToken");
  const token = await Token.deploy();
  await token.waitForDeployment();
  console.log(`[✓] JADITOKEN BERJAYA DILANCARKAN!`);
  console.log(`[!] Kunci Alamat Kontrak Ini: ${token.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
