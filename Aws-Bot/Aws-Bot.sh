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

name=Aws-Bot
echo
green "命令提示:screen -r Aws-Bot   恢复后台运行 | Ctrl + a + d   保持后台运行"
echo
stty erase '^H' && read -p "请输入机器人Token：" Token

ip=`curl http://whatismyip.akamai.com`


key() {
> /root/$name/config.yml
cat >> /root/$name/config.yml<<EOF
Log_Level: error
Bot_Token: Tokent
User_Info:
  0:
    User_Name: ""
    Now_Key: ""
    Aws_Secret: {}
EOF
}

install() {

rm -f /root/$name/*
mkdir -p /root/$name

yum -y install unzip zip
wget https://raw.githubusercontent.com/guliter/Panel/main/$name/Aws-Bot -P /root/$name
chmod -R 777 /root/$name
#unzip /root/$name/Aws-Bot.zip -d /root/$name
chmod -R 777 /root/$name
cd /root/$name
key
pack
}




pack() {
#sed -i '2c 'Bot_Token: '$Token'' /root/$name/config.yml
key
sed -i "s/Tokent/$Token/g" /root/$name/config.yml
echo
green "命令提示:
https://github.com/Yuzuki616/Aws-Manger-Bot
1.|sudo yum install epel-release;yum install screen&&screen -S Aws-Bot
2.|cd /root/Aws-Bot&&./Aws-Bot
3.|Ctrl + a + d	保持后台运行 
screen -r Aws-Bot 恢复后台运行"
echo 
}


if [ ! -f "/root/$name/config.yml" ];then
install
else
pack
fi
