#!/usr/bin/env bash

set -e

blogDir="${PWD}/../blog"

if [[ -n "${1}" ]]; then
    blogDir=$1
fi

themeDir="${blogDir}/themes"

if [ -e "${themeDir}/yilia/source" ]; then
    echo -e "\e[1;31m \bSource Directory Already Exists! \e[1;0m\a" \
      && read -p "Override It? [Y|N]: " -a inputStr

    inputStr=$(echo $inputStr | tr 'a-z' 'A-Z')
    if [[ ! -z $inputStr && $inputStr == "Y" || $inputStr == 'YES' ]]; then

        cp -r ./source/ "${themeDir}/yilia/"

        if [[ $? -eq 0  ]]; then
            echo -e "\e[1;32m \bSuccess! \e[1;0m"
        else
            echo -e "\e[1;31m \bError \e[1;0m"

            exit 1
        fi

        exit
    else
        echo -e "\e[1;32m \bExit... \e[1;0m"

        exit 0
    fi
fi

