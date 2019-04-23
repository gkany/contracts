#!/bin/bash

#Usage: ./walletRemoveKey.sh accountPublicKey

#walletKey="PW5HpUC3TvMsBuw7yso28tg3uNk2MV6s1TWfHFV6P2EhWzZz6mKtJ"
walletKey="PW5JhGdzRrXdFrNz2bzEWgw9nGyczeH6decathQppMGQ99HViEGGm"

cleos wallet remove_key $1 --password $walletKey
 

