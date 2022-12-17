FROM python:2.7
# Install OpenSSL
RUN apt-get update
RUN apt-get install -y libssl-dev
RUN apt-get install -y git
RUN apt-get install -y libtool
RUN apt-get install -y autoconf automake
RUN apt-get install -y build-essential pkg-config libglib2.0-dev libjsoncpp-dev uuid-dev libmbedtls-dev liblz4-dev libcap-ng-dev
RUN apt-get install -y libssl-dev liblzo2-dev libpam0g-dev
RUN pip install docutils
COPY submodules/openvpn /install
WORKDIR /install
RUN autoreconf -i -v -f
RUN ./configure
RUN make
RUN make install
COPY submodules/easy-rsa/easyrsa3 /install/
# # Tests
# RUN make check
ENV PATH=$PATH:/install
COPY ./scripts /install/scripts
CMD scripts/enable-tun.sh && bash