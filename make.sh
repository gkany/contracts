#/bin/bash

cd $1

eosio-cpp -abigen -o $1.wasm $1.cpp


