
# ERC20 Token Contract


The code you provided is an implementation of an ERC20 token contract in Solidity. Here's a brief description of the contract and its functionalities:

## Description

The ERC20 token contract is a standardized implementation that defines a range of functions and events for managing fungible tokens. It includes variables like totalSupply, balanceOf, and allowance to track the overall token supply, individual address balances, and approved spending amounts, respectively. Additionally, it offers functions such as transfer, approve, and transferFrom to facilitate token transfers and approvals. There are also functionalities like mint and burn for token creation and destruction, alongside a health system represented by the total_health variable, which can be adjusted using the attack and heal functions. The contract emits events such as Transfer and Approval to notify relevant parties when token transfers and approvals occur.

On the other hand, the Vault contract serves as a secure repository for tokens, interacting with the ERC20 token contract to enable users to deposit and withdraw tokens. Upon deployment, the Vault contract accepts the address of an ERC20 token in its constructor and initializes a token variable to store the instance of the token contract. It maintains records such as totalSupply and a balanceOf mapping to manage the shares held by addresses. The contract provides a deposit function allowing users to deposit tokens into the vault. During deposit, it calculates the proportionate number of shares based on the deposited amount and the current token balance in the vault, minting these shares to the sender. The tokens are transferred from the sender's address to the vault utilizing the transferFrom function of the token contract. Similarly, the contract includes a withdraw function enabling users to retrieve tokens from the vault. In this process, it calculates the corresponding amount of tokens based on the shares being withdrawn and transfers them back to the sender's address, while burning the equivalent shares from the sender's balance.

## Getting Started
 
 ### Installing code

 You can clone this repo or download zip file and run it locally or you can run the code on remix 

 Head over to this website: https://remix.ethereum.org/.
 ### Executing the code

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ERC20game.sol). Copy and paste the solidity file into the remix file

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.17" (or above version), and then click on the "Compile ERC20game.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "solidity" contract from the dropdown menu, change the environment to 'Injected provider' and connect your metamask account, and then click on the "Deploy" button.

### Subnet 
 
Follow the below github repository's readme file in order to install avalanche CLI to your Ubuntu or Mac terminal:
 
 [https://docs.avax.network/tooling/cli-guides/install-avalanche-cli](https://github.com/ava-labs/avalanche-cli)

In order to create a subnet, we run -

```
avalanche subnet create mySubnet
```

In order to deploy the created subnet, we run -

```
avalanche subnet deploy mySubnet
```

To connect your subnet to metamask, you will need to :

* Add network manually and enter Name, RPC URL, Token Symbol and Chain ID that you entered while creating the subnet.
* Import account with test tokens by entering the private key that you get from the terminal after you deploy the subnet.

 
## License

This code is licensed under the [MIT](https://choosealicense.com/licenses/mit/) license.See the LICENSE file for more information.


