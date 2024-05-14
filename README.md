# Degen Token

## Description
Degen Token is an ERC20 token contract implemented on the Ethereum blockchain. It provides functionalities for minting tokens, buying and redeeming in-game assets (elixir, coins, gems) using Degen Tokens as currency.

## Features
- Minting of tokens by the contract owner.
- Buying in-game assets (elixir, coins, gems) with Degen Tokens.
- Redeeming in-game assets back to Degen Tokens.

## Usage

### Contract Deployment
To deploy the Degen Token contract, provide the address of the initial owner who will have administrative privileges.

### Minting Tokens
Only the contract owner can mint additional Degen Tokens using the `mint` function.

### Buying In-Game Assets
Players can buy in-game assets using Degen Tokens by calling the `buyElixir`, `buyCoins`, or `buyGems` functions, providing the desired amount of the asset.

### Redeeming In-Game Assets
Players can redeem in-game assets back to Degen Tokens using the `redeemElixir`, `redeemCoins`, or `redeemGems` functions, providing the desired amount of the asset.

### Transferring Tokens
Users can transfer Degen Tokens to other addresses using the standard ERC20 `transfer` function.

### Burning Tokens
Tokens can be burned by anyone using the `anyoneBurn` function, reducing the total supply.

## Asset Prices
- Price of 1 elixir in Degen Token: 100 Degen Tokens
- Price of 1 coin in Degen Token: 50 Degen Tokens
- Price of 1 gem in Degen Token: 200 Degen Tokens

## License
This contract is licensed under the MIT License.

