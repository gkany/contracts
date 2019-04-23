#!/bin/bash

#编译：
#eosio-cpp -I include -o eosio.token.wasm src/eosio.token.cpp --abigen

#部署合约： [部署合约账号：eosio]
cleos set contract eosio.token /Users/a123/prj/contracts/eosio.contracts/eosio.token --abi eosio.token.abi -p eosio.token@active

#create token:
cleos push action eosio.token create '{"issuer":"eosio.token", "maximum_supply":"1000000000.0000 EOS"}' -p eosio.token@active

#issue token:
cleos push action eosio.token issue '[ "alice", "1000000.0000 EOS", "memo" ]' -p eosio.token@active

#transfer token:
cleos push action eosio.token transfer '[ "alice", "bob", "5000.0000 EOS", "m" ]' -p alice@active
cleos push action eosio.token transfer '[ "alice", "eosio.token", "5000.0000 EOS", "m" ]' -p alice@active

#查询账号(bob)资产余额：
cleos get currency balance eosio.token bob EOS


