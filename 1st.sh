#!/bin/bash
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
    
    echo

