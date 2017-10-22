#
#!/bin/bash
#

clear

read -p "Nama pengguna yang akan di buka kunci: " userNama
passwd -u $userNama
echo "========================================"
