#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


# 设置字体颜色函数
function blue(){
    echo -e "\033[34m\033[01m $1 \033[0m"
}
function green(){
    echo -e "\033[32m\033[01m $1 \033[0m"
}
function greenbg(){
    echo -e "\033[43;42m\033[01m $1 \033[0m"
}
function red(){
    echo -e "\033[31m\033[01m $1 \033[0m"
}
function redbg(){
    echo -e "\033[37;41m\033[01m $1 \033[0m"
}
function yellow(){
    echo -e "\033[33m\033[01m $1 \033[0m"
}
function white(){
    echo -e "\033[37m\033[01m $1 \033[0m"
}

name=aws-Panel

ip=`curl http://whatismyip.akamai.com`



install() {
rm -f /root/$name/AWS.zip
rm -f /root/$name/AWS-Panel-linux-amd64
#rm -f /root/$name/*
mkdir -p /root/$name

yum -y install unzip zip
wget https://raw.githubusercontent.com/guliter/Panel/main/AWS.zip -P /root/$name
chmod -R 777 /root/$name
unzip /root/$name/AWS.zip -d /root/$name
chmod -R 777 /root/$name

#screen -r aws

cd /root/$name  
pack
}




pack() {
echo
redbg "【AWS-Panel】-默认面板:http://${ip}:8011 【admin admin123456】"
echo
green "命令提示:

1.|sudo yum install epel-release;yum install screen&&screen -S aws
2.|cd /root/aws-Panel&&./AWS-Panel-linux-amd64 
3.|Ctrl + a + d	保持后台运行 
screen -r aws	恢复后台运行"
echo 
}


if [ ! -f "/root/aws-Panel/data.db" ];then
install
else
pack
fi
