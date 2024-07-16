#!/bin/zsh

#Flush all rules
iptables -F
iptables -t nat -F

#Allow udp and tcp DNS
iptables -A FORWARD -i wlp2s0 -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -i wlp2s0 -p udp --dport 53 -j ACCEPT

iptables -A FORWARD -i wlp2s0 -p tcp --dport 3000 -d 192.168.163.76 -j ACCEPT
iptables -A FORWARD -i wlp2s0 -j DROP

#Redirect HTTP request to captif portal
iptables -t nat -A PREROUTING -i wlp2s0 -p tcp --dport 80 -j DNAT --to-destination 192.168.163.76:3000



