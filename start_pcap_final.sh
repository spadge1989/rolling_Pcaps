#!/bin/bash
echo "Starting Packet Capture"
sudo ifconfig eno1 promisc
sleep 30
sudo tcpdump -ni eno1 -w /pcaps/ESS_Fault-%m-%d-%H-%M-%S -G 3600

