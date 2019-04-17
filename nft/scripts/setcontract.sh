#!/bin/bash

#eosio-cpp -abigen -I. -o nft.wasm nft.cpp

cleos set contract eosio /Users/a123/prj/contracts/EOS-1808 nft.wasm nft.abi -p eosio@active

