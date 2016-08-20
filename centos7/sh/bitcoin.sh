#!/bin/bash
su - bitcoin
wget https://bitcoin.org/bin/bitcoin-core-0.12.1/bitcoin-0.12.1-linux64.tar.gz
tar -xzf *.tar.gz

# callback
mkdir -p sh
tee ./sh/callback.sh <<-'EOF'
#!/bin/bash
curl -s http://somehost/api/tx?txid=$1
NOW=$(date +"%m-%d-%Y %T")
echo $1 $NOW >> log.txt
EOF

# bitcon conf
mkdir -p ~/.bitcoin
tee ~/.bitcoin/bitcoin.conf <<-'EOF'
rpcuser=bitcoinrpc
rpcpassword=11111111112222222222333333333344444444445555
rpcallowip=192.168.1.1/0
EOF
chmod 600 .bitcoin/bitcoin.conf

# autostart: crontab -e
# @reboot /bitcoin/bitcoin/bitcoin/bin/bitcoind -walletnotify='/bitcoin/bitcoin/sh/callback.sh %s' -daemon

# PATH
# export PATH=$PATH:$HOME/bitcoin/bin

# debug lib
#yum install -y boost-devel libevent-devel libdb4-devel libdb4-cxx-devel
