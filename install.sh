#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
MAGENTA='\033[1;35m'
NC='\033[0m'

# Typing effect
type_text() {
    text="$1"
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${text:$i:1}"
        sleep 0.01
    done
    echo ""
}

# Banner
clear
echo -e "${MAGENTA}"
figlet "BIG BOY"
echo -e "${CYAN}=============================="
type_text ">>> Initializing System..."
sleep 1
type_text ">>> Loading Modules..."
sleep 1
type_text ">>> Access Granted ✔"
echo -e "==============================${NC}"

# Function with error skip
run_cmd() {
    echo -e "${YELLOW}[+] $1${NC}"
    bash -c "$1"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[✔] Done${NC}"
    else
        echo -e "${RED}[✘] Skipped${NC}"
    fi
    echo "------------------------------"
}

# Update
echo -e "${CYAN}>>> Updating System...${NC}"
run_cmd "sudo apt update -y && sudo apt upgrade -y"

# Packages
packages=(
python3 python3-pip python2 openjdk-17-jdk fish ruby git host
php perl nmap bash clang nano w3m hydra figlet cowsay curl
tar zip unzip tor sudo wget wireshark wcalc bmon unrar toilet
proot net-tools golang openssl cmatrix openssh-client macchanger
espeak coreutils sl dnsutils fortune libcaca-utils
)

echo -e "${CYAN}>>> Installing Tools...${NC}"

for pkg in "${packages[@]}"
do
    run_cmd "sudo apt install -y $pkg"
done

# Python packages
pip_packages=(
async_generator pyaes rsa colorama telethon requests
mechanize bs4 futures rich
)

echo -e "${CYAN}>>> Installing Python Modules...${NC}"

run_cmd "pip3 install --upgrade pip"

for pkg in "${pip_packages[@]}"
do
    run_cmd "pip3 install $pkg"
done

# Finish animation
echo -e "${MAGENTA}"
type_text ">>> Finalizing Setup..."
sleep 1
type_text ">>> Cleaning Traces..."
sleep 1
echo -e "${GREEN}>>> SYSTEM READY ✔${NC}"
echo -e "${MAGENTA}==============================${NC}"