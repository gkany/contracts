#!/bin/bash

#Usage: ./createAccount.sh accountName

file="keytemp"
keys=".accountKeys"
name=$1

cleos create key --file $file
cat $file >> $keys
echo "eos account: $name" >> $keys

head -n 1 $file | awk -F ':' 'cmd="cleos wallet import --private-key "$2; system(cmd)'
tail -n 1 $file | awk -F ':' 'cmd="cleos create account eosio " "'${name}'" $2; system(cmd)'

# cleos system newaccount --stake-net '0.01 EOS' --stake-cpu '0.01 EOS' --buy-ram-kbytes 2 <创建者的账户名> <新创建的账户名> <你的公钥>

echo "-------------------------------" >> $keys
rm $file


