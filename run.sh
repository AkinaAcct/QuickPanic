#!/usr/bin/env bash
# By Akina

########################################## WARNING #########################################
# 这个工具是用来收集安卓panic方法的。运行此脚本代表你默认自行承担由此产生的损失。

warning() {
    echo -e "\033[31m警告！！！！！！！！继续运行可能导致你的手机  死机  或  立即重启！！！！！！！！！你确定要继续吗？？\033[0m"
    read -p ""
}
warning
warning
warning
echo -e "\033[34m我还是不会运行。如果你一定要运行，请source此文件并手动使用内部函数。\033[0m"

# METHOD 1
sysrq_panic() {
    warning
    su -c echo "1" >/proc/sys/kernel/sysrq
    su -c echo "c" >/proc/sysrq-trigger
}
# METHOD 2
forkbomb_panic() {
    warning
    panic() { panic | panic & }
    warning
    panic
}
# METHOD 3
killzygote_panic(){
    warning
    su -c kill -9 $(pidof zygote)
    su -c kill -9 $(pidof zygote64)
}
# METHOD 4
# developing...
