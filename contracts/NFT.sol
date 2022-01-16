// SPDX-License-Identifier: MIT License

pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721{

    constructor() ERC721("Dummy NFT", "DNFT") {}

    uint private _tokenId = 0;

    function mint() external returns (uint){

        _tokenId++;
        _mint(msg.sender, _tokenId);

        return _tokenId;
    }
}