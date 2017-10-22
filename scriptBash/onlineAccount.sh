#
#!/bin/bash
#

clear

echo "========================================"
echo -e "Senarai Akaun Aktif" 
echo "-------------------------------"

data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo "-------------------------------"
echo "DropBear";
echo "-------------------------------"
for PID in "${data[@]}"
do
	authUser=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
	userName=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $10}'`;
	ipAddress=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $12}'`;
	if [ $authUser -eq 1 ]; then
		echo "$PID - $userName - $ipAddress";
	fi
done

data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
echo "-------------------------------"
echo "SecureShell";
echo "-------------------------------"
for PID in "${data[@]}"
do
	authUser=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | wc -l`;
	userName=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $9}'`;
	ipAddress=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $11}'`;
	if [ $authUser -eq 1 ]; then
		echo "$PID - $userName - $ipAddress";
	fi
done
echo "========================================"
