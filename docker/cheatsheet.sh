#!/bin/bash


docker run --detach --rm --env CASENV_CAS_VIRTUAL_HOST=docker.tumbosh.sashq-d.openstack.sas.com --env CASENV_CAS_VIRTUAL_PORT=8087 --publish-all --publish 8087:80 --name <docker container name> --hostname <doogramming:18.10.0-20181116192615-623cd79
latest                           5182e96772bf        3 months ago        200MB
registry                                                   latest                           b2b03e9146e1        4 months ago        33.3MB

For the 'sas-viya-programming' docker image, you can run the following command to create and start the container:
docker run --detach --rm --env CASENV_CAS_VIRTUAL_HOST=rdcesx01217.race.sas.com --env CASENV_CAS_VIRTUAL_PORT=8085 --publish-all --publish 8085:80 --name naga-test-registry-viya  destiny.unx.sas.com:5000/tsad-sasawb-centrify-working:v1

To create and start a container with the 'viya-single-container' image and no addons, submit:
docker run --detach --rm --env CASENV_CAS_VIRTUAL_HOST=docker.tumbosh.sashq-d.openstack.sas.com --env CASENV_CAS_VIRTUAL_PORT=8087 --publish-all --publish 8087:80 --name sas-viya-programming --hostname sas.vi-container 


For the 'sas-viya-programming' docker image, you can run the following command to create and start the container:
docker run --detach --rm --env CASENV_CAS_VIRTUAL_HOST=docker.tumbosh.sashq-d.openstack.sas.com --env CASENV_CAS_VIRTUAL_PORT=8081 --publish-all --publish 8081:80 --name <docker container name> --hostname <docker hostname> sas-viya-pr                                                                                                                                             ogramming:18.10.0-20181116192615-623cd79


docker run --detach --rm --env CASENV_CAS_VIRTUAL_HOST=docker.tumbosh.sashq-d.openstack.sas.com --env CASENV_CAS_VIRTUAL_PORT=8081 --publish-all --publish 8081:80 --name <docker container name> --hostname destiny.unx.sas.com:5000/tsad-sasawb-centrify-working:v1

kubectl run --image=destiny.unx.sas.com:5000/tsad-sasawb-centrify-working:v1 --port=8081

{
"insecure-registries": ["destiny.unx.sas.com:5000","docker.sas.com/repositories:5000","k8s-node-1.tumbosh.sashq-d.openstack.sas.com:30000"],
"registry-mirrors": ["http://destiny.unx.sas.com:5000"]
}

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1docker
EOF

cat <<EOF >  /etc/docker/daemon.json
{
"insecure-registries": ["k8s-node-1.tumbosh.sashq-d.openstack.sas.com:30000"]
}
EOF
root@k8s-master centos]# kubeadm token create --print-join-command
kubeadm join 10.104.86.42:6443 --token cu3hzy.gshqn7peebi2ow2u --discovery-token-ca-cert-hash sha256:8f71a19040915c516af41983e61818fa0574092541a4b05733b5d25bd673c8a2


kubectl get deployments
kubectl get deployments
kubectl expose deployment naga-k8s-test-viya --type=NodePort
kubectl describe pods  naga-k8s-test-viya-84cf659988-ptmjc
kubectl get services 
kubectl get pods 
kubectl run --image=destiny.unx.sas.com:5000/tsad-sasawb-centrify-working:v1 --port=8081
kubectl run --image=destiny.unx.sas.com:5000/tsad-sasawb-centrify-working:v1 naga-k8s-test-viya  --port=80
kubectl describe pods  naga-k8s-test-viya-84cf659988-ptmjc

[root@docker certs]# openssl pkcs12 -in docker-certificate-keystore.pfx | sed -ne '/-BEGIN PRIVATE KEY-/,/-END PRIVATE KEY-/p' > ../private/localhost.key
Enter Import Password:
MAC verified OK
Enter PEM pass phrase:
Verifying - Enter PEM pass phrase:
[root@docker certs]# openssl pkcs12 -in  docker-certificate-keystore.pfx -clcerts -nokeys | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >  localhost.crt
Enter Import Password:
MAC verified OK
[root@docker certs]# pwd
/etc/pki/tls/certs
[root@docker certs]# openssl pkcs12 -in <filename.pfx> -cacerts -nokeys -chain | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/pki/tls/certs/chain.pem
bash: filename.pfx: No such file or directory
[root@docker certs]# openssl pkcs12 -in docker-certificate-keystore.pfx -cacerts -nokeys -chain | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/pki/tls/certs/chain.pem
Enter Import Password:
MAC verified OK
[root@docker certs]# ls -la localhost.crt
-rwxr-xr-x 1 root root 2374 Nov 16 19:15 localhost.crt
[root@docker certs]# ls -la chain.pem
-rwxr-xr-x 1 root root 4338 Nov 16 19:16 chain.pem
[root@docker certs]# ls -la ../private/localhost.key
-rwxr-xr-x 1 root root 0 Nov 16 19:13 ../private/localhost.key
[root@docker certs]#





#common docker related commands that I forget.

#check + remove docker bridge network

ip addr
ipconfig -a
ip link del docker0

