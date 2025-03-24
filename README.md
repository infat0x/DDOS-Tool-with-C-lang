# 🚀 infat0x DDOS Tool

This repository contains a powerful **DDOS attack tool** written in **C language**.  
To make execution easier, you can use the **infat0x.sh** script.  

⚠ **WARNING:**  
This tool is **for educational and security testing purposes only**.  
**Unauthorized use is illegal!** Use it only on your own network for testing.  

---

## 📂 Contents  

- `source.c` → Source code of the DDOS attack tool  
- `DDOS` → Compiled and executable DDOS tool  
- `infat0x.sh` → Bash script to launch the tool  

---

## 🔧 Installation  

### **1️⃣ Clone the Repository**  
```bash
sudo su
cd /opt
git clone https://github.com/infat0x/infat0x-ddos.git
```
### **2️⃣ Grant Execution Permissions**  
```bash
cd /opt/infat0x-ddos
chmod +x *
```
## 🚀 Usage
```bash
cd /opt/infat0x-ddos
./infat0x.sh
```
## 🛠 Manual Compilation (If Needed)
```bash
cd infat0x-ddos
gcc -O3 source.c -o DDOS
chmod +x DDOS
./infat0x.sh
