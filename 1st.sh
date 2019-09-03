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
