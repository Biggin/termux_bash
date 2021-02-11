#!/usr/bin/env bash

# Script to add a new Name to a Linux System
export Name="${1}"
if [ -z "${Name}" ]; then
    echo -e "Please enter a Name"
    read -r Name
fi
sudo useradd "${Name}" -m -s /bin/bash
passwd "${Name}"
chage -d 0 "${Name}"
