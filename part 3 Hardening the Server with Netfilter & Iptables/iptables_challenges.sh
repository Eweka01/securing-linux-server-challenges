#!/bin/bash
# iptables_challenges.sh
# Solutions for Netfilter and iptables challenges

# Challenge #1: Set default policy
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Challenge #2: List filter table INPUT chain
iptables -t filter -L INPUT

# Challenge #3: Flush filter table
iptables -t filter -F

# Challenge #4: Drop incoming SSH (first rule)
iptables -I INPUT 1 -p tcp --dport 22 -j DROP

# Challenge #5: Flush all tables and set ACCEPT policy on all
iptables -F
iptables -X
iptables -t nat -F
iptables -t mangle -F
iptables -t raw -F
iptables -t security -F
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# Challenge #6: Drop specific IPs
iptables -I INPUT 1 -s 100.0.0.1 -j DROP
iptables -I INPUT 2 -s 1.2.3.4 -j DROP
iptables -I OUTPUT 1 -d 80.0.0.1 -j DROP

# Challenge #7: Drop outgoing TCP to linuxquestions.org
iptables -I OUTPUT -p tcp -d www.linuxquestions.org --dport 80 -j DROP
iptables -I OUTPUT -p tcp -d www.linuxquestions.org --dport 443 -j DROP

# Challenge #8: Same as #7 but on router (FORWARD chain)
iptables -I FORWARD -p tcp -d www.linuxquestions.org --dport 80 -j DROP
iptables -I FORWARD -p tcp -d www.linuxquestions.org --dport 443 -j DROP

# Challenge #9: Drop from network 27.103.0.0/16
iptables -I INPUT 1 -s 27.103.0.0/16 -j DROP

# Challenge #10: Block DNS except to 8.8.8.8 (router)
iptables -A FORWARD -p udp --dport 53 ! -d 8.8.8.8 -j DROP

# Challenge #11: Laptop firewall (allow outgoing + return traffic)
iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Challenge #12: Allow only router MAC
iptables -A INPUT -m mac --mac-source b4:6d:83:77:85:f5 -j ACCEPT
iptables -A OUTPUT -m mac --mac-source b4:6d:83:77:85:f5 -j ACCEPT

# Challenge #13: Allow web traffic between 10:00 and 18:00 UTC
iptables -A OUTPUT -p tcp --dport 80 -m time --timestart 10:00 --timestop 18:00 --utc -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -m time --timestart 10:00 --timestop 18:00 --utc -j ACCEPT

# Challenge #14: Same as #13 but only weekends
iptables -A OUTPUT -p tcp --dport 80 -m time --timestart 10:00 --timestop 18:00 --weekdays Sat,Sun --utc -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -m time --timestart 10:00 --timestop 18:00 --weekdays Sat,Sun --utc -j ACCEPT

echo "All iptables challenge commands executed."
