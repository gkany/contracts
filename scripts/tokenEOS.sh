#!/bin/bash

#参考：https://developers.eos.io/eosio-home/docs/token-contract

#eos合约:
#git clone https://github.com/EOSIO/eosio.contracts --branch v1.5.2 --single-branch

#编译：cd eosio.contracts/eosio.token
#eosio-cpp -I include -o token.wasm src/token.cpp --abigen

#部署合约： [部署合约账号：token]
#token账号是已经创建好的本地账号
#注意：一个账号只能部署一个合约，部署eosio.token的最好不要和其他的重复使用
cleos set contract token /Users/a123/prj/contracts/eosio.contracts/eosio.token --abi eosio.token.abi -p token@active

#create token:
cleos push action token create '{"issuer":"token", "maximum_supply":"1000000000.0000 EOS"}' -p token@active

#alice和bob也是已经创建好的本地测试账号
#issue token:
cleos push action token issue '[ "alice", "1000000.0000 EOS", "memo" ]' -p token@active

#transfer token:
cleos push action token transfer '[ "alice", "bob", "5000.0000 EOS", "m" ]' -p alice@active
cleos push action token transfer '[ "alice", "token", "5000.0000 EOS", "m" ]' -p alice@active

#查询账号(bob)资产余额：
cleos get currency balance token bob EOS


