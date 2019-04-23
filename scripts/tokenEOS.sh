#!/bin/bash

#编译：
#eosio-cpp -I include -o token.wasm src/token.cpp --abigen

#部署合约： [部署合约账号：eosio]
cleos set contract token /Users/a123/prj/contracts/eosio.contracts/eosio.token --abi eosio.token.abi -p token@active

#create token:
cleos push action token create '{"issuer":"token", "maximum_supply":"1000000000.0000 EOS"}' -p token@active

#issue token:
cleos push action token issue '[ "alice", "1000000.0000 EOS", "memo" ]' -p token@active

#transfer token:
cleos push action token transfer '[ "alice", "bob", "5000.0000 EOS", "m" ]' -p alice@active
cleos push action token transfer '[ "alice", "token", "5000.0000 EOS", "m" ]' -p alice@active

#查询账号(bob)资产余额：
cleos get currency balance token bob EOS


