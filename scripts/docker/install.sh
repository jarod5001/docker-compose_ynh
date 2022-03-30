#!/bin/bash

# Install docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
# sudo systemctl enable --now docker
sudo usermod -aG docker admin
newgrp docker
sudo service docker restart

# Install Docker Compose
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
chmod +x docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose

# Install yacht.sh
docker volume create yacht
docker pull selfhostedpro/yacht
docker run -d -p 8001:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config selfhostedpro/yacht
