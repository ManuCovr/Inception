*This project has been created as part of the 42 curriculum by mde-maga.*

## Description
Docker NGINX+WordPress+MariaDB. Custom Debian images, TLSv1.3 HTTPS, named volumes in ~/data/.

**VM→Docker:** Containers lighter than VMs
**Secrets→ENV:** Secure file storage  
**Docker Network:** Container isolation
**Named Volumes:** Persistent portable data

## Instructions
1. `su -`, install Docker, `usermod -aG docker $USER`, reboot
2. `echo "127.0.0.1 mde-maga.42.fr" >> /etc/hosts`  
3. `make`

## Resources
Docker docs, NGINX TLSv1.3, WordPress Docker
No AI was used on the making of this project