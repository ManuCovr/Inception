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
srcs/
├── requirements/
│ ├── nginx/Dockerfile # Custom NGINX + TLSv1.3
│ ├── wordpress/Dockerfile # php8.2-fpm + WP core
│ └── mariadb/Dockerfile # MariaDB + init script
├── docker-compose.yml # Services + named volumes
└── .env # Domain + DB config
secrets/ # Password files


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