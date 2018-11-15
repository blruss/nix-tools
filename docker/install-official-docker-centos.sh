#official repo https://download.docker.com/linux/centos/7/x86_64/stable/Packages/

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum-config-manager --enable docker-ce-edge
sudo yum-config-manager --enable docker-ce-test
#sudo yum-config-manager --disable docker-ce-edge  
sudo yum install docker-ce
sudo systemctl status docker
sudo systemctl start docker
 
 echo "Don't forget to create /etc/docker/daemon.json"
 sudo systemctl stop docker
#test docker
#sudo docker run hello-world
