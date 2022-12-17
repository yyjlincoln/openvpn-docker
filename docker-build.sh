set -ex
git submodule update --init
docker build -t openvpn-docker .