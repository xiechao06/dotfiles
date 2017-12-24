#!/bin/sh

echo "SELECT BEST MIRROR OF APT SOURCES"
cat << EOF | cat -  /etc/apt/sources.list > temp && sudo mv temp /etc/apt/sources.list
deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse
EOF
