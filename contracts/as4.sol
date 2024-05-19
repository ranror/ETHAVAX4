// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    uint256 public constant ELIXIR_PRICE = 100; // Price of 1 elixir in Degen Token
    uint256 public constant COINS_PRICE = 50; // Price of 1 coin in Degen Token
    uint256 public constant GEM_PRICE = 200; // Price of 1 gem in Degen Token
    address ownerAddress = address(0);
    mapping(address => uint256) public elixirBalance;
    mapping(address => uint256) public coinsBalance;
    mapping(address => uint256) public gemsBalance;

    constructor(address payable initialOwner) ERC20("Degen", "DGN") Ownable(initialOwner){
       ownerAddress = initialOwner;
    }

    function mint(uint256 amount) external onlyOwner {
        _mint(ownerAddress, amount);
    }
    function anyoneBurn(uint256 amount) public {
        _burn(ownerAddress,amount);
    }
      function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function buyElixir(uint256 amount) external {
        uint256 totalCost = amount * ELIXIR_PRICE;
        require(balanceOf(msg.sender) >= totalCost, "Insufficient Degen Token balance");
        elixirBalance[msg.sender] += amount;
        _burn(msg.sender, totalCost);
    }

    function buyCoins(uint256 amount) external {
        uint256 totalCost = amount * COINS_PRICE;
        require(balanceOf(msg.sender) >= totalCost, "Insufficient Degen Token balance");
        coinsBalance[msg.sender] += amount;
        _burn(msg.sender, totalCost);
    }

    function buyGems(uint256 amount) external {
        uint256 totalCost = amount * GEM_PRICE;
        require(balanceOf(msg.sender) >= totalCost, "Insufficient Degen Token balance");
        gemsBalance[msg.sender] += amount;
        _burn(msg.sender, totalCost);
    }

    function redeem(uint256 elixirAmount, uint256 coinsAmount, uint256 gemsAmount) external {
        // Check if the sender has enough balances for redemption
        require(elixirBalance[msg.sender] >= elixirAmount, "Insufficient elixir balance");
        require(coinsBalance[msg.sender] >= coinsAmount, "Insufficient coins balance");
        require(gemsBalance[msg.sender] >= gemsAmount, "Insufficient gems balance");
        
        // Update balances
        elixirBalance[msg.sender] -= elixirAmount;
        coinsBalance[msg.sender] -= coinsAmount;
        gemsBalance[msg.sender] -= gemsAmount;

        // Calculate the total amount of Degen Tokens to mint for redemption
        uint256 totalTokensToMint = (elixirAmount * ELIXIR_PRICE) + (coinsAmount * COINS_PRICE) + (gemsAmount * GEM_PRICE);

        // Mint the tokens to the sender
        _mint(msg.sender, totalTokensToMint);
    }
}
