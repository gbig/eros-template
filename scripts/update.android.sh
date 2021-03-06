#!/bin/bash

eros_prefix="[\033[34meros\033[0m]"

function error_exit {
    echo "--------------------------------------------"
    echo -e "\033[31m Error code is $1 \033[0m" 1>&2
    echo ""
    echo " Code tips: "
    echo -e "\033[33m1 -> platforms/android/WeexFrameworkWrapper/ is not existed. \033[0m"
    echo -e "\033[33m2 -> cannot cannot git pull platforms/android/WeexFrameworkWrapper/wxframework, you can try a manual operation. \033[0m"
    echo -e "\033[33m2 -> cannot cannot git pull platforms/android/WeexFrameworkWrapper/sdk, you can try a manual operation. \033[0m"
    echo -e "\033[33m2 -> cannot cannot git pull platforms/android/WeexFrameworkWrapper/bmwidget, you can try a manual operation. \033[0m"
    exit 1
}

cd platforms/android/WeexFrameworkWrapper/ || \
error_exit 1
echo -e "$eros_prefix Enter android project"

if [ -e wxframework/ ] || [ -e sdk/ ] || [ -e bmwidget/ ]
then
    echo -e "$eros_prefix Start to updating."

    cd wxframework/ && git pull || error_exit 2
    cd ../sdk/ && git pull || error_exit 3
    cd ../bmwidget/ && git pull || error_exit 4
    cd ..

    echo -e "$eros_prefix Android sdk has been installed, enjoy it! "
else
    echo -e "$eros_prefix No wxframework, sdk or bmwidget file, make sure you had been run eros install."
fi
  