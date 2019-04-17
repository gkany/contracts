#!/bin/bash

cleos push action eosio addnftattr '{"owner": "eosio", "nftid": 0, "key": "attack_power", "value": "70"}' -p eosio@active
cleos push action eosio addnftattr '{"owner": "eosio", "nftid": 0, "key": "weight", "value": "120kg"}' -p eosio@active

