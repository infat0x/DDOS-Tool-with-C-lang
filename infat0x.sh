#!/bin/bash


GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' 


clear
echo -e "${YELLOW} ${NC}"
echo -e "${YELLOW} ${NC}"

echo -e "${RED} 	       _        ___           ______         ${NC}"
echo -e "${RED} 	      (_)      / __)     _   / __   |        ${NC}"
echo -e "${RED} 	       _ ____ | |__ ____| |_| | //| |_   _   ${NC}"
echo -e "${RED} 	      | |  _ \|  __) _  |  _) |// | ( \ / )  ${NC}"
echo -e "${RED} 	      | | | | | | ( ( | | |_|  /__| |) X (   ${NC}"
echo -e "${RED} 	      |_|_| |_|_|  \_||_|\___)_____/(_/ \_)  ${NC}"
echo -e "${RED}		   		    			    			     ${NC}"                                      

echo -e "${YELLOW} ${NC}"
echo -e "${YELLOW} ${NC}"



echo -e "${YELLOW}  ===============================================================${NC}"
echo -e "${BLUE}   	  🛡️DDOS Attack Launcher🛡️     \uF09B github.com/infat0x ${NC}"
echo -e "${YELLOW}  ===============================================================${NC}"
function exit_script {
	echo -e "${RED}🚫 Exiting the script. Goodbye!${NC}"
	exit 0
}

echo " Select your language / Select language:"
echo " 1) Engish"
echo " 2) Azərbaycanca"
echo " 3) Türkçe"
echo " x) Exit"	
read -p " Select (1/2/3/x): " lang

if [ "$lang" == "x" ]; then
	exit_script
elif [ "$lang" == "1" ]; then
	GREETING=" Hello!"
	echo -e "${GREEN} Please enter the following information:${NC}"

	read -p " 🎯 Target Host (example.com): " host
	read -p " 📡 Target IP (192.168.1.1): " ip
	read -p " ⚡ Target Port (80/443 etc.): " port
	read -p " 📂 Subsite (e.g., /login or /): " subsite
	read -p " ⏳ Delay Time (ms, 0 for fast attack): " delay

	
	echo -e "${YELLOW}======================================================================${NC}"
	echo -e "${RED}📢 WARNING: You should only use this for legal security testing purposes.${NC}"
	echo -e "${YELLOW}======================================================================${NC}"

	read -p "⚠️  Do you want to proceed? (y/n): " confirm
	if [[ $confirm != "y" ]]; then
		echo -e "${RED}🚫 Operation canceled.${NC}"
		exit 1
	fi

	
	clear
	echo -e "${GREEN}🚀 Starting the attack...${NC}"
	echo -e "${YELLOW}Target: ${BLUE}$host${NC} (${RED}$ip${NC})"
	echo -e "${YELLOW}Port: ${BLUE}$port${NC}, Subsite: ${BLUE}$subsite${NC}, Delay: ${BLUE}$delay ms${NC}"
	echo -e "${GREEN}⚔️ Running the DDOS tool...${NC}"

	./ddos_tool "$host" "$ip" "$port" "$subsite" "$delay"



elif [ "$lang" == "2" ]; then
	GREETING="Salam!"
	echo -e "${GREEN}Zəhmət olmasa aşağıdakı məlumatları daxil edin:${NC}"

	read -p "🎯 Hədəf Host (example.com): " host
	read -p "📡 Hədəf IP (192.168.1.1): " ip
	read -p "⚡ Hədəf Port (80/443 və s.): " port
	read -p "📂 Subsite (məsələn: /login və ya /): " subsite
	read -p "⏳ Gecikmə Vaxtı (ms, sürətli hücum üçün 0): " delay

	
	echo -e "${YELLOW}======================================================================================${NC}"
	echo -e "${RED}📢 XƏBƏRDARLIQ: Bu aləti yalnız qanuni təhlükəsizlik testləri üçün istifadə etməlisiniz.${NC}"
	echo -e "${YELLOW}======================================================================================${NC}"

	read -p "⚠️  Davam etmək istəyirsinizmi? (b/x): " confirm
	if [[ $confirm != "b" ]]; then
		echo -e "${RED}🚫 Əməliyyat ləğv edildi.${NC}"
		exit 1
	fi

	
	clear
	echo -e "${GREEN}🚀 Hücum başlayır...${NC}"
	echo -e "${YELLOW}Hədəf: ${BLUE}$host${NC} (${RED}$ip${NC})"
	echo -e "${YELLOW}Port: ${BLUE}$port${NC}, Subsite: ${BLUE}$subsite${NC}, Gecikmə: ${BLUE}$delay ms${NC}"
	echo -e "${GREEN}⚔️ DDOS aləti işə salınır...${NC}"

	./ddos_tool "$host" "$ip" "$port" "$subsite" "$delay"



elif [ "$lang" == "3" ]; then
	GREETING="Merhaba!"
	echo -e "${GREEN}Lütfen aşağıdaki bilgileri giriniz:${NC}"

	read -p "🎯 Hedef Host (example.com): " host
	read -p "📡 Hedef IP (192.168.1.1): " ip
	read -p "⚡ Hedef Port (80/443 vb.): " port
	read -p "📂 Alt Sayfa (örneğin: /login veya /): " subsite
	read -p "⏳ Gecikme Süresi (ms, hızlı saldırı için 0): " delay

	
	echo -e "${YELLOW}===============================================================================${NC}"
	echo -e "${RED}📢 UYARI: Bu aracı yalnızca yasal güvenlik testi amaçları için kullanmalısınız.${NC}"
	echo -e "${YELLOW}===============================================================================${NC}"

	read -p "⚠️  Devam etmek istiyor musunuz? (e/h): " confirm
	if [[ $confirm != "e" ]]; then
		echo -e "${RED}🚫 İşlem iptal edildi.${NC}"
		exit 1
	fi

	
	clear
	echo -e "${GREEN}🚀 Saldırı başlatılıyor...${NC}"
	echo -e "${YELLOW}Hedef: ${BLUE}$host${NC} (${RED}$ip${NC})"
	echo -e "${YELLOW}Port: ${BLUE}$port${NC}, Alt Sayfa: ${BLUE}$subsite${NC}, Gecikme: ${BLUE}$delay ms${NC}"
	echo -e "${GREEN}⚔️ DDOS aracı çalıştırılıyor...${NC}"

	./ddos_tool "$host" "$ip" "$port" "$subsite" "$delay"
else
	GREETING="Invalid selection!"
fi

