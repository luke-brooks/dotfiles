# finds the Brother Printer based off of known MAC address
alias printer_ip="arp -a | grep ac:d1:b8:90:cc:71 | cut -d \"(\" -f 2 | cut -d \")\" -f 1"