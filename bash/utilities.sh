# finds the Brother Printer based off of known MAC address
alias printer_ip="arp -a | grep ac:d1:b8:90:cc:71 | cut -d \"(\" -f 2 | cut -d \")\" -f 1"

# searches listening local network ports by port number
pidport() {
    lsof -n -i4TCP:$1 | grep LISTEN
}

# retrieves just port number from pidport output
my_get_port_pid() {
    pidport $1 | tr -s " " | cut -f2 -d " "
}

# not quite there yet
kill_port_pid() {
    echo 'killing process occupying port ' $1
    kill -9 $(my_get_port_pid $1)
}