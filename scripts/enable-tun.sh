set -e
cd /dev
mkdir net
mknod net/tun c 10 200
chmod 0666 net/tun