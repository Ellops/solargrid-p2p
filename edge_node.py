import os
import time
from web3 import Web3
from dotenv import load_dotenv

# Carrega variaveis de ambiente (.env)
load_dotenv()

# Configuracao Web3 via linha de comando
INFURA_URL = os.getenv("INFURA_URL", "https://sepolia.infura.io/v3/SEU_PROJECT_ID")
PRIVATE_KEY = os.getenv("PRIVATE_KEY")
w3 = Web3(Web3.HTTPProvider(INFURA_URL))

if not w3.is_connected():
    print("[-] Falha ao conectar na rede Ethereum.")
    exit()

print("[+] Conectado à rede Sepolia.")
account = w3.eth.account.from_key(PRIVATE_KEY)
print(f"[+] Carteira do Nó Local: {account.address}")

# Em um cenario real, esses dados viriam da porta serial / GPIO / I2C do sensor
def read_smart_meter():
    """Simula a leitura de um sensor de corrente AC gerando excedente"""
    import random
    excess_kwh = round(random.uniform(0.5, 3.5), 2)
    return excess_kwh

def run_node():
    print("[*] Iniciando monitoramento de energia na borda...")
    try:
        while True:
            excess = read_smart_meter()
            print(f"[!] Leitura do Medidor: {excess} kWh de excedente detectado.")
            
            if excess > 2.0:
                print(f"[*] Limite excedido. Preparando registro de oferta on-chain...")
                # Aqui entraria a chamada ao Smart Contract via w3.eth.contract
                # tx = contract.functions.registerEnergyOffer(int(excess * 100)).build_transaction(...)
                print("[+] Oferta registrada com sucesso no mercado P2P.")
            else:
                print("[*] Nível normal. Nenhuma ação necessária.")
                
            time.sleep(10) # Aguarda 10 segundos para a proxima leitura
    except KeyboardInterrupt:
        print("\n[-] Daemon de monitoramento encerrado.")

if __name__ == "__main__":
    run_node()
