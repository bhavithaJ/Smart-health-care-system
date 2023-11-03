## ℹ️ Problem Statement
The health care sector contributes significantly to society by offering vital services for people's 
personal and communal welfare. However, it encounters numerous difficulties that affect its 
effectiveness, security, and capacity to provide top-notch care. The administration and 
confidentiality of health care information stand out as crucial issues amongst these difficulties.


## ℹ️ About The Project
The Smart Healthcare System is an innovative blockchain-based solution designed to revolutionize healthcare data management and insurance claim processing. It leverages the power of blockchain technology to enhance data security, privacy, and efficiency in the healthcare sector. By securely storing patient records, prescriptions, and medical data, the system ensures data integrity and prevents unauthorized access or tampering. It also employs smart contracts for automating insurance claims, resulting in faster and more transparent processing. The project's primary goals include improving patient care, streamlining the insurance process, and fostering trust in the healthcare industry through a secure and efficient data management platform.

## ℹ️ Future Prospects
1. We will be implementing insurance policy , so as to specify the uniqueness and ownership of each insurance policy.
2. We will be giving patients the flexibility to buy health insurance policy according to their preference instead of defined policies by the insurance provider.
3. We will do enhancements in the Smart Healthcare System involve AI-driven risk assessment and personalized policies tailored to health behaviors and real-time monitoring.

<!-- GETTING STARTED -->

## 📌 Installation

To setup the project locally follow the steps below

### 💻 Prerequisites

- [Node.js](https://nodejs.org/en/download/)
- [Ganache](https://trufflesuite.com/ganache/)
- [Metamask Wallet Extension](https://docs.docker.com/compose/install/) or a Web3 browser like Brave

### 🤖 Running the project.

To set this up in the local repository:

1. **Fork** and **clone** the project to your local system
2. Copy the commands below to install the dependencies:

```
npm i -g truffle
npm run client:install
npm run truffle:install
```

3. Now, start a local Hyperledger Fabric blockchain network on your system using Ganache. Ganache provides you with 10 testing accounts each with 100 ETH. 

4. Obtain Infura API Key and API Secret for IPFS from [Infura Dashboard](https://infura.io/), and create a dedicated gateway for your project. Set the environment variables in `client/.env` file. Or you can rename `client/.env.example` to `client/.env`
```bash
REACT_APP_INFURA_PROJECT_ID=...
REACT_APP_INFURA_API_KEY_SECRET=...
REACT_APP_INFURA_DEDICATED_GATEWAY=....
```

5. Then, copy the following commands to deploy the smart contracts to the local Hyperledger Fabric blockchain 

```
npm run truffle:migrate
npm run client:start
```

6. Set up Metamask to connect to the local blockchain created by Ganache(i.e. [http://localhost:8545/](http://localhost:8545/))

7. Now, obtain the private keys of some of the accounts from Ganache and import the accounts into Metamask wallet.

8. you are ready to go.
