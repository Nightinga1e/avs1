#!/bin/bash

V_INTERFACE_NUM = $(ls -A /sys/class/net | wc -l)
echo Дата: 
date -R
echo 
echo Имя учетной записи: 
whoami
echo
echo Доменное имя ПК: 
hostname
echo
echo Процессор:
echo
    echo Модель - 
    lscpu | grep -i Имя | cut -c1-46 | rev | cut -c1-25 | rev
    echo

    echo Архитектура - 
    lscpu | grep -i Архитектура |rev| cut -c1-6|rev
    echo

    echo Тактовая частота -
    lscpu | grep -i Имя |rev|cut -c1-7|rev
    echo

    echo Количество ядер -
    lscpu | grep -i "CPU(s):" -m 1 | rev|cut -c1-1|rev
    echo
    
    echo Количество потоков на одно ядро - 
    lscpu | grep -i Thread | rev|cut -c1-1|rev
    echo

echo Оперативная память:
echo
    echo Всего -
    free| awk 'NR == 2{print $2}'
    echo
    
    echo Доступно -
    free| awk 'NR == 2{print $7}'
    echo

echo Жесткий диск:
echo
    echo Всего -
    lsblk | awk ' NR ==2{print $4}'
    echo

    echo Доступно -
    df -h | awk ' NR ==6{print $4}'
    echo

    echo Смонтировано в корневую директрорию 
    lsblk | grep -i "/" | cut -c1-7
    echo
    
    echo SWAP всего - 
    free | awk 'NR == 3{print $2}'
    echo


    echo SWAP доступно -
    free | awk 'NR == 3{print$4}'
    echo

echo Сетевые интерфейсы:
echo
    echo Количество сетевых интерфейсов -
	ls -A /sys/class/net | wc -l
    echo

#for ((i=0; i<=V_INTERFACE_NUM; i++))
#do
    #    V_INTERFACE_NAME=$(ip -o -f inet address | awk -F' ' '{print $2}')
    echo "#  name         ip                  mac                        speed"
    echo -ne "1: " & ip -o -f inet address | awk -F' ' 'NR == 1{printf $2}'
    echo -ne "     "
    echo -ne "     "& ip -o -f inet address | awk -F' ' 'NR == 1{printf $4}'

    echo
    echo -ne "2: " & ip -o -f inet address | awk -F' ' 'NR == 2{printf $2}'
    echo -ne "      "
    echo -ne & ip -o -f inet address | awk -F' ' 'NR == 2{printf $4}'
    echo -ne "      " & ifconfig | grep -i ether| awk 'NR == 1{printf $2}'
    echo -ne "          " & cat /sys/class/net/enp2s0/speed

    echo -ne "3: " & ip -o -f inet address | awk -F' ' 'NR == 3{printf $2}'
    echo -ne "      "
    echo -ne & ip -o -f inet address | awk -F' ' 'NR ==3{printf $4}'
    echo -ne "      " & ifconfig | grep -i ether| awk ' NR ==2{printf $2}'

    cat /sys/class/net/enp2s0/speed
#	V_INTERFACE_NAME=$(ip -o -f inet address | awk -F' ' '{print $2}' | tr '\n' ' ' | awk -v var="$i" 'BEGIN {FS = " "} {print $var}')
#	V_INTERFACE_IPAD=$(ip -o -f inet address | awk -F' ' '{print $4}')
#	V_INTERFACE_MACAD=$(cat /sys/class/net/$V_INTERFACE_NAME/address) 
#	printf "\033[s\033[4C$i\033[s\033[4C$V_INTERFACE_NAME\n\033[u\033[12C$V_INTERFACE_IPAD\n"
#	printf "\033[s\033$i\033[s\033[4C$V_INTERFACE_NAME\033[u\033[12C$V_INTERFACE_IPAD\033[u\033[36C$V_INTERFACE_MACAD\n"
#done

#lspci



