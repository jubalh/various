sudo apt-get update && apt-get install git-core curl build-essential openssl libssl-dev

git clone https://github.com/joyent/node.git
cd node
# 'git tag' shows all available versions: select the latest stable.
git checkout v0.6.8
./configure --openssl-libpath=/usr/lib/ssl
make
make test
sudo make install
node -v # it's alive!
