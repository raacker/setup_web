#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Please run with sudo"
   exit 1
fi

# install flask
pip3 install Flask
apt-get install -y virtualenv

sudo -u haven virtualenv -p python3 $HOME/flask_dev

echo "alias act-flask='source $HOME/flask_dev/bin/activate'" >> ~/.bashrc

# install redis
apt-get install -y redis-server redis-tools

# install postgresql
apt-get install -y postgresql postgresql-contrib

# install pgAdmin4
sudo -u haven wget -O $HOME/Downloads/pgadmin4-2.0-py2.py3-none-any.whl https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v2.0/pip/pgadmin4-2.0-py2.py3-none-any.whl
pip3 install $HOME/Downloads/pgadmin4-2.0-py2.py3-none-any.whl
echo "alias pgAdmin4='sudo python3 /usr/local/lib/python3.5/dist-packages/pgadmin4/pgAdmin4.py'" >> ~/.bashrc

# install Postman
sudo -u haven wget -O $HOME/Downloads/Postman-linux-x64.tar.gz https://dl.pstmn.io/download/latest/linux64
tar -xf $HOME/Downloads/Postman-linux-x64.tar.gz --directory $HOME
echo "alias postman='nohup $HOME/Postman/Postman &'" >> ~/.bashrc

# install VS Code
cd $HOME
sudo -u haven wget -O $HOME/Downloads/pkg_vscode https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i $HOME/Downloads/pkg_vscode
