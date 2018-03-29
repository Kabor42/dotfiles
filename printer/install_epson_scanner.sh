#!/usr/bin/env bash

echo "Installing Epson Perfection 660"

cp TAIL_061.BIN /usr/share/sane/snapscan
echo "firmware /usr/share/sane/snapscan/TAIL_061.BIN" >> /etc/sane.d/snapscan.conf

echo "Epson Perfection 660 is installed!"
