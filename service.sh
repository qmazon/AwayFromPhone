#!/system/bin/sh

# 获取模块路径
MODDIR=${0%/*}

# 启动守护进程
nohup $MODDIR/tools/keeper.sh > /dev/null 2>&1 &