## NFT-SMARTCONTRACT

Imagine one want to start their own NFT marketplace. This repo contains basis for NFT marketplace capturing etherium smart contracts. 

### Functions 

This repo contains basic functions such as;

    1. listTokens()
    2. getListing()
    3. buyToken()
    4. Cancle()

## What is Covered ?

Eventually, this repo helps in basic structre smart contract where;

    1. Seller of NFT can list their token in terms of NFT 
    2. Buyer can BUY the listed NFT 
    3. Seller due to any reason can cancel the transaction without charging or transaction to occur.

## Use Cases

Use cases can be many, from digital art to music to anything. 

## Installation

Fork or clone this repo, move to the project folder and run below;

```bash
# npm 
npm i

# yarn 
yarn add
```

## Pre-requisite 

You should have ganache installed on your machine. You can download ganache [here](https://trufflesuite.com/ganache/).

Also, you can install truffle globally on your machine by running below command in your terminal;

```bash
npm install -g truffle
```

## Deploying or Migrating Smart Contract  

Run below command in your terminal inside project folder;

```bash
# Compile - generates abis for smart contracts
npx truffle compile 

OR

# Migrate Smart Contacts
npx truffle migrate 

# During testing you can re-migrate your smart contracts 
npx truffle migrate --reset
```

## Do you want to Collaborate?

If you are interested in add more functionality to this repo, please fork this repo and add your suggested functionality and raise PR. 

Let's make things easier for everyone together in NFT marketplace.

