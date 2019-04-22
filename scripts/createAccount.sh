#!/bin/bash

#Usage: ./createAccount.sh accountName

file="keytemp"
keys="accountKeys"
name=$1

cleos create key --file $file
cat $file >> $keys
echo "eos account: $name" >> $keys

head -n 1 $file | awk -F ':' 'cmd="cleos wallet import --private-key "$2; system(cmd)'
tail -n 1 $file | awk -F ':' 'cmd="cleos create account eosio " "'${name}'" $2; system(cmd)'

echo "-------------------------------" >> $keys
rm $file


