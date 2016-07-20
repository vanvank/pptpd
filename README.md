# A pptpd docker image based on centos 6.7

## How to use this image? 
### Run your container by:
```docker run -d -p 1723:1723 --privileged -v /lib/modules:/lib/modules:ro vanvank/pptpd```

After your container is running, you will need to modifiy the login password and dns
### Connect and manage your container 
```docker exec -ti /bin/bash YourContainerName```

### Modify or add your login password
``` vi /etc/ppp/chap-secrets ```
``` 
# Secrets for authentication using CHAP
# client        server  secret                  IP addresses 
"LoginName" pptpd "Password" * 
```

### Modify the dns to use through vpn
```
vi /etc/ppp/options.pptpd

ms-dns 192.168.5.10    # change this ip address to your dns server's ip
```
### Find the pptpd server log
In the container, you can see the logs by ```tail -f /var/log/messages```
