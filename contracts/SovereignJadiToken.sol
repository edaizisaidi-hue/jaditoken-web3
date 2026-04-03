// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SovereignJadiToken is ERC20 {
    constructor() ERC20("JADITOKEN", "JADI") {
        // Minting 13 Bilion Token ke Dompet Tuan (18 perpuluhan)
        _mint(msg.sender, 13000000000 * 10 ** decimals());
    }
}
