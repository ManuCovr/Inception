all: create_dirs up

create_dirs:
	sudo mkdir -p ~/data/db ~/data/wordpress

up:
	cd srcs && docker compose up --build -d

down:
	cd srcs && docker compose down

clean:
	cd srcs && docker compose down -v
	sudo docker system prune -a -f --volumes

fclean: clean
	sudo rm -rf ~/data/*

re: fclean all

ps:
	sudo docker ps

.PHONY: all create_dirs up down clean fclean re ps
