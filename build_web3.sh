#!/bin/bash
echo -e "\n[STATUS: OMEGA AKTIF - Membina Infrastruktur Web3 Polygon]"

# 1. Cipta Zon Kedaulatan Kripto
mkdir -p ~/vault/projects/jaditoken-web3
cd ~/vault/projects/jaditoken-web3

# 2. Inisialisasi Ekosistem Node.js
echo ">> [1/5] Mengaktifkan Persekitaran Node..."
npm init -y > /dev/null

# 3. Pemasangan Pakej Gred-Tentera
echo ">> [2/5] Memasang Hardhat, OpenZeppelin & Ethers..."
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox dotenv > /dev/null
npm install @openzeppelin/contracts > /dev/null

# 4. Bina Struktur Direktori Hardhat
mkdir -p contracts scripts

# 5. Injeksi Kontrak Pintar (Solidity)
echo ">> [3/5] Menempa Cetak Biru JADITOKEN..."
cat << 'EOF' > contracts/SovereignJadiToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SovereignJadiToken is ERC20 {
    constructor() ERC20("JADITOKEN", "JADI") {
        // Minting 13 Bilion Token ke Dompet Tuan (18 perpuluhan)
        _mint(msg.sender, 13000000000 * 10 ** decimals());
    }
}
EOF

# 6. Konfigurasi Rangkaian (Polygon Mainnet)
echo ">> [4/5] Menetapkan Kordinat Polygon Mainnet..."
cat << 'EOF' > hardhat.config.js
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.20",
  networks: {
    polygon: {
      url: "https://polygon-rpc.com",
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : []
    }
  }
};
EOF

# 7. Skrip Deployment Automatik
echo ">> [5/5] Membina Logik Pelancaran..."
cat << 'EOF' > scripts/deploy.js
const hre = require("hardhat");

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
EOF

# 8. Cipta Zon Rahsia (.env)
echo "PRIVATE_KEY=MASUKKAN_PRIVATE_KEY_DOMPET_DI_SINI" > .env

echo -e "\n[✓] INFRASTRUKTUR WEB3 SIAP. Zon beroperasi di: ~/vault/projects/jaditoken-web3"
