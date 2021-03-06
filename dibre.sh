#!/usr/bin/bash

echo -e '\x1b[32m1 - DIBRAR\n2 - VOLTAR AO NORMAL\n\n\x1b[00m'
read -rp "Opção: " opc_

if [[ "$opc_" == "1" ]]; then
  sudo iptables -P INPUT DROP && sudo iptables -F INPUT
  # parte nova:
  sudo iptables -A INPUT -p tcp --dport 80 -s 127.0.0.1 -j DROP && echo -e "NMAP DIBRADO"
  exit 0
elif [[ "$opc_" == "2" ]]; then
  sudo iptables -P INPUT ACCEPT && echo -e "VOLTOU AO NORMAL"
  # parte nova:
  sudo iptables -F
  exit 0
else
  [[ -z "$(command -v iptables)" ]] &&
    echo -e "iptables não está instalado no seu sistema!\n"
  #echo -e "iptables não instalado no seu sistema!\n"
  exit 1
fi

# Para testar, rode esse comando:
# sudo nmap --script=qscan 127.0.0.1 -n -vvv --ttl=128 -Pn --reason --top-ports=10
