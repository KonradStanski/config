# download git repo and unzip it
# copy-pastable command for running this script anywhere:
# curl -fsSL https://raw.githubusercontent.com/konradstanski/config/master/bootstrap.sh | bash
curl -sL https://github.com/konradstanski/config/archive/master.tar.gz | tar xz
cd config-master
./install.sh
