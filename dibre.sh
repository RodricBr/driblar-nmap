#!/usr/bin/bash

echo -e '\x1b[32m1 - DIBRAR\n2 - VOLTAR AO NORMAL\n\n\x1b[00m'
read -rp "Opção: " opc_

echo -e "Comando NMAP:\nsudo nmap --script=qscan 127.0.0.1 -n -vvv --ttl=128 -Pn --reason --top-ports=10"

if [[ "$opc_" == "1" ]]; then
  sudo iptables -P INPUT DROP
  sudo iptables -F INPUT
  exit 0
elif [[ "$opc_" == "2" ]]; then
  sudo iptables -P INPUT ACCEPT
  exit 0
else
  echo -e "iptables não instalado no seu sistema!\n"
  exit 1
fi

#
