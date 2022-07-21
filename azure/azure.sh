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


add() {
green "
docker exec -it cloudpanel /bin/bash
python3 manage.py createsuperuser

"    
}

install() {
echo
docker run --name cloudpanel -d -it -p 8111:80 --restart=always cdntip/cloudpanel:v1.1 /bin/bash
redbg "【azure-Panel】-默认面板:http://${ip}:8111"
echo
clear
start_menu
}


start_menu(){
    clear
    echo
    white "—————————————基础环境安装——————————————"
    red "1.安装面板"
    blue "2.添加用户"
    red "3.卸载面板 "
    white ""
    echo
    read -p "请输入数字:" num
    case "$num" in
    1)
    install
	;;
    2)
    add
    ;;
    3)
    docker stop cloudpanel
    docker rm cloudpanel
    ;;
	0)
	exit 1
	;;
	*)
	clear
	echo "请输入正确数字"
	sleep 3s
	start_menu
	;;
    esac
}

start_menu
