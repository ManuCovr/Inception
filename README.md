*_This project has been created as part of the 42 curriculum by mde-maga._*

## Description
**Docker NGINX+WordPress+MariaDB** infrastructure using custom **Debian** images with **TLSv1.3 HTTPS**, **named volumes** in `~/data/`.

**VM→Docker**: Containers share host kernel (5-10x lighter, <1s startup vs minutes) [web:1]  
**Secrets→ENV**: Secrets mount as files (in memory only), ENV vars persist in logs/images [web:9]  
**Docker Network**: Container isolation + DNS vs host network (security risk, no isolation) [web:1]  
**Named Volumes**: Docker-managed, portable vs bind mounts (host-specific paths) [web:9]

## Instructions
1. `su -`, install Docker, `usermod -aG docker $USER`, reboot
2. `echo "127.0.0.1 mde-maga.42.fr" >> /etc/hosts`  
3. `make`

## Resources
[Docker docs](https://docs.docker.com), [NGINX TLSv1.3](https://nginx.org/en/docs/http/configuring_https_servers.html), [WordPress Docker](https://hub.docker.com/_/wordpress)  
No AI was used.