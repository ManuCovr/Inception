# Developer Documentation

## Prerequisites
- Fresh **42 VM** with **Docker** + **docker-compose**
- `usermod -aG docker $USER` + **reboot**

## Setup
- git clone <repo> inception/
- cd inception/
- echo "127.0.0.1 mde-maga.42.fr" >> /etc/hosts
- mkdir -p ~/data/{mariadb,wordpress}
- make

## Project Structure
- srcs/requirements/ contains the Dockerfiles:
  * nginx/Dockerfile - Custom NGINX with TLSv1.3 
  * wordpress/Dockerfile - php8.2-fpm + WordPress core
  * mariadb/Dockerfile - MariaDB server + database init script
  
- srcs/docker-compose.yml defines all services and named volumes
- srcs/.env holds domain name and database configuration
- secrets/ contains password files (gitignored)


## Key Commands
```bash
make              # Build + start
make down         # Stop containers
make re           # Restart
docker volume ls  # Check named volumes
docker network ls # Check inception_net
```

## Volume Mapping
srcs_mariadb_data → /home/mde-maga/data/mariadb
srcs_wordpress_data → /home/mde-maga/data/wordpress