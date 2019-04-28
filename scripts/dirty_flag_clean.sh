#!/bin/bash

#用于异常停止服务的恢复
#nodeos --data-dir /opt/eosio/bin/data-dir --hard-replay-blockchain --truncate-at-block [有问题的区块编号] -e  
#--replay-blockchain表示清除数据库内链的状态，重新运行，它会导致重新启动时先读取之前的区块进行加载

#data_dir使用的是默认配置的路径下面省略了
#有问题的编号在log里面找

number=$1
nodeos --hard-replay-blockchain --truncate-at-block $number -e


