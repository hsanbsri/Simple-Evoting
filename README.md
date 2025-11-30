
# Grpc & Rest API

How to install

1. Buat File Genesis.json
{
  "config": {
    "chainId": 2025,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "clique": {
      "period": 2,
      "epoch": 30000
    }
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "4BEda80ddec6AbfB5222bD2B8F6E9b18be6A9e9A": { "balance": "1000000000000000000000" },
    "6Bcb1b628f37a4b5f2BeA4c678F70bAFc6AD53F9": { "balance": "1000000000000000000000" }
  },
  "extraData": "0x00000000000000000000000000000000000000000000000000000000000000004BEda80ddec6AbfB5222bD2B8F6E9b18be6A9e9A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
}

2. Inisialisasi database
geth init --datadir node1 genesis.json
geth init --datadir node2 genesis.json

3. Jalankan bootnode
bootnode -nodekey bootnode/boot.key -addr :30301

4. Jalankan Node di masing-masing terminal
## Node 1
geth --datadir node1 \
--networkid 2025 \
--port 30303 \
--http --http.addr "0.0.0.0" \
--http.port 8545 \
--http.corsdomain "*" \
--http.vhosts "*" \
--http.api "admin,eth,net,web3,personal,miner,clique" \
--allow-insecure-unlock \
--unlock "0x4BEda80ddec6AbfB5222bD2B8F6E9b18be6A9e9A" \
--password node1/password.txt \
--mine \
--miner.etherbase "0x4BEda80ddec6AbfB5222bD2B8F6E9b18be6A9e9A" \
--bootnodes "enode://b796e153946f3eb85d97ce58dbeaa3964bcd0edcec8d58b01dac3c367fa9af031fe4b22dd62b9bf3b7b7bd6ac487af0796acec93f66b1a55f167650dda73ab64@127.0.0.1:0?discport=30301" \
console

## node2
geth --datadir node2 \
--networkid 2025 \
--port 30304 \
--authrpc.port 8552 \
--bootnodes "enode://b796e153946f3eb85d97ce58dbeaa3964bcd0edcec8d58b01dac3c367fa9af031fe4b22dd62b9bf3b7b7bd6ac487af0796acec93f66b1a55f167650dda73ab64@127.0.0.1:0?discport=30301" \
console


5. Hubungkan Ke metamask & coba transaksi via metamask

6. #coba kirim transaksi
eth.sendTransaction({ 
from: "0x4BEda80ddec6AbfB5222bD2B8F6E9b18be6A9e9A", 
to: "0xeabc981e87dd201fe59638fc5495413e53bfafe8", 
value: web3.toWei(100, "ether") 
})

=== Optional Info for check status ===
txpool.status

7. deploy voting.sol menggunakan metamask

8. Jalankan frontend menggunakan 
python3 -m http.server 8000


Look at http://localhost:8000/

