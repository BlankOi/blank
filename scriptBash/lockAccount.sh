#
#!/bin/bash
#

clear

read -p "Nama pengguna yang akan di kunci: " userNama
passwd -l $userNama
echo "========================================"
