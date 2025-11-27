
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
    "istanbulBlock": 0,
    "muirGlacierBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "clique": {
      "period": 2,
      "epoch": 30000
    }
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "893824fdAc529184C0Fe9AA3d25ED40F80146d2C": { "balance": "1000000000000000000000" },
    "8F094C26bBCA7894f715B33cEF2D92FdEF7C9F08": { "balance": "1000000000000000000000" }
  },
  "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000893824fdAc529184C0Fe9AA3d25ED40F80146d2C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
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
--unlock "0x893824fdAc529184C0Fe9AA3d25ED40F80146d2C" \
--password node1/password.txt \
--mine \
--miner.etherbase "0x893824fdAc529184C0Fe9AA3d25ED40F80146d2C" \
--bootnodes "enode://126eda422f88a99bc05d5e7187191b39944dda5d7d0ee9bce62b3c00907c4bd8ebb29381ce0c30c4cf8b0d6b964950a715c096be14c3bf92066b72a7f82ce0dd@127.0.0.1:0?discport=30301" \
console

## node2
geth --datadir node2 \ 
--networkid 2025 \ 
--port 30304 \ 
--bootnodes  "enode://126eda422f88a99bc05d5e7187191b39944dda5d7d0ee9bce62b3c00907c4bd8ebb29381ce0c30c4cf8b0d6b964950a715c096be14c3bf92066b72a7f82ce0dd@127.0.0.1:0?discport=30301" \ 
Console


#coba kirim transaksi
eth.sendTransaction({ 
from: "0x893824fdAc529184C0Fe9AA3d25ED40F80146d2C", 
to: "0xeabc981e87dd201fe59638fc5495413e53bfafe8", 
value: web3.toWei(100, "ether") 
})

5. Hubungkan Ke metamask & coba transaksi via metamask

6. deploy voting.sol menggunakan metamask

7. Jalankan frontend menggunakan 
python3 -m http.server 8000


Look at http://localhost:8000/

