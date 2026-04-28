# SolarGrid P2P - Mercado Local de Energia ☀️⚡

MVP de um protocolo descentralizado para negociação Peer-to-Peer de energia solar excedente utilizando Smart Contracts e dispositivos IoT de borda.

## Arquitetura
- **Blockchain:** Ethereum (Testnet Sepolia)
- **Smart Contracts:** Solidity ^0.8.20 (Hardhat)
- **Integração IoT:** Script CLI em Python (`web3.py`) simulando um Smart Meter (compatível com execução embarcada em Raspberry Pi ou ESP32).

## Endereços dos Contratos (Sepolia Testnet)
*Substitua pelos endereços reais após o deploy:*
- **SolarToken (ERC-20):** `0x0000000000000000000000000000000000000000`
- **SolarUnit (ERC-721):** `0x0000000000000000000000000000000000000000`
- **SolarStaking:** `0x0000000000000000000000000000000000000000`
- **SolarDAO:** `0x0000000000000000000000000000000000000000`

[Verificar no Sepolia Etherscan](https://sepolia.etherscan.io/)

## Como Executar
1. Instale as dependências: `npm install` e `pip install -r requirements.txt`
2. Compile os contratos: `npx hardhat compile`
3. Faça o deploy: `npx hardhat run scripts/deploy.js --network sepolia`
4. Execute o nó IoT: `python3 scripts/edge_node.py`

---
**Autor:** Ewerton Vasconcelos Lopes
