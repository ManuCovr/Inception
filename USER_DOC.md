# User Documentation

## Services Provided
- **NGINX**: HTTPS reverse proxy (port 443, TLSv1.3 only)
- **WordPress + php-fpm**: Dynamic content (connected via fastcgi)
- **MariaDB**: WordPress database (2 users: `wpuser`, `siteadmin`)

## Start/Stop
make
make down
make clean


## Access
- **Website**: https://mde-maga.42.fr (self-signed cert OK)
- **Admin**: https://mde-maga.42.fr/wp-admin
- **Default credentials**: Check `secrets/credentials.txt`

## Data Storage
/home/mde-maga/data/
    - mariadb (database files)
    - wordpress (website files)

## Health Check
```bash
docker ps                    # All 3 containers running
curl -k https://mde-maga.42.fr | head -5  # HTML response
docker logs inception-nginx-1 | tail     # No errors
```