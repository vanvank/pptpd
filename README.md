# a pptpd docker image based on centos 6.7
you can run your container by:
docker run -d -p 1723:1723 --privileged -v /lib/modules:/lib/modules:ro pptpd

After your container is running, you will need to modifiy the login password and dns
1. First connect to your container by "docker exec -ti /bin/bash YourContainerName"

2. In the container, modify or add your login password like below
vi /etc/ppp/chap-secrets

# Secrets for authentication using CHAP
# client        server  secret                  IP addresses
"jason" pptpd "xyz123" *

# then, your username is jason, password is xyz123

3. modify the dns you would like to use when connecting to vpn
vi /etc/ppp/options.pptpd
change below ip address to your dns server's ip

ms-dns 192.168.5.10

you can find the pptpd server log in "/var/log/messages"
when you connect to vpn, you can see the logs very convenient by "tail -f /var/log/messages"
