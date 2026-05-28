
#!/bin/bash

clear

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}========================================${NC}"
echo -e "${GREEN} NETHEAD VPS AUTO INSTALLER${NC}"
echo -e "${CYAN}========================================${NC}"

sleep 2

apt update -y
apt upgrade -y

apt install -y \
curl \
wget \
sudo \
nginx \
dropbear \
stunnel4 \
haproxy \
cron \
jq \
socat \
net-tools \
unzip

systemctl enable nginx
systemctl enable dropbear
systemctl enable stunnel4
systemctl enable haproxy

systemctl start nginx
systemctl start dropbear
systemctl start stunnel4
systemctl start haproxy

# INSTALL XRAY
bash <(curl -Ls https://raw.githubusercontent.com/XTLS/Xray-install/main/install-release.sh)

# INSTALL 3X-UI
bash <(curl -fsSL https://raw.githubusercontent.com/MHSanaei/3x-ui/master/install.sh)

# CREATE MENU
cat > /usr/local/bin/menu << 'EOF'
#!/bin/bash

GREEN='\033[1;32m'
RED='\033[1;31m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

while true; do

clear

SSH=$(systemctl is-active ssh)
NGINX=$(systemctl is-active nginx)
XRAY=$(systemctl is-active xray)
STUNNEL=$(systemctl is-active stunnel4)
DROPBEAR=$(systemctl is-active dropbear)

echo -e "${CYAN}=================================================${NC}"
echo -e " SSH: ${GREEN}$SSH${NC}   NGINX: ${GREEN}$NGINX${NC}   X-RAY: ${GREEN}$XRAY${NC}"
echo -e " STUNNEL: ${GREEN}$STUNNEL${NC}   DROPBEAR: ${GREEN}$DROPBEAR${NC}   WS: ${GREEN}ON${NC}"
echo -e "${CYAN}=================================================${NC}"

echo -e "                ${YELLOW}• SCRIPT MENU •${NC}"

echo -e "${CYAN}=================================================${NC}"

echo -e " [ 01 ] SSH Menu         [ 06 ] Bot Menu"
echo -e " [ 02 ] XRAY Menu        [ 07 ] Backup Menu"
echo -e " [ 03 ] NoobZ Menu       [ 08 ] System Menu"
echo -e " [ 04 ] Warp+ Menu       [ 09 ] API Setting Menu"
echo -e " [ 05 ] Trojan Go Menu   [ 10 ] DNS Tunnel Menu"

echo -e " [ x ] Exit Panel"

echo -e "${CYAN}=================================================${NC}"

echo
read -p " Select Menu : " opt

case $opt in

1|01)
systemctl restart ssh
systemctl restart dropbear
echo
echo "SSH Services Restarted"
sleep 2
;;

2|02)
x-ui
;;

3|03)
echo
echo "NoobZ Placeholder"
sleep 2
;;

4|04)
echo
echo "Warp+ Placeholder"
sleep 2
;;

5|05)
echo
echo "Trojan-Go Placeholder"
sleep 2
;;

6|06)
echo
echo "Bot Placeholder"
sleep 2
;;

7|07)
echo
echo "Backup Placeholder"
sleep 2
;;

8|08)
clear
echo "========================================"
echo " SYSTEM INFORMATION"
echo "========================================"
echo "Hostname : $(hostname)"
echo "IP       : $(curl -s ifconfig.me)"
echo "RAM      : $(free -h | awk '/Mem:/ {print $3"/"$2}')"
echo "Uptime   : $(uptime -p)"
echo "Kernel   : $(uname -r)"
echo "========================================"
echo
read -n 1 -s -r -p "Press any key to continue..."
;;

9|09)
echo
echo "API Placeholder"
sleep 2
;;

10)
clear
systemctl status systemd-resolved --no-pager
echo
read -n 1 -s -r -p "Press any key to continue..."
;;

x|X)
clear
exit
;;

*)
echo
echo "Invalid Option"
sleep 1
;;

esac

done
EOF

chmod +x /usr/local/bin/menu

echo "menu" >> ~/.bashrc

clear

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN} INSTALLATION COMPLETE${NC}"
echo -e "${GREEN}========================================${NC}"

echo
echo "COMMAND:"
echo "menu"

echo
echo "3X-UI PANEL:"
echo "x-ui"

echo
echo "INSTALL FINISHED SUCCESSFULLY"
```
