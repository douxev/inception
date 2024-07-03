all:
	@mkdir -p ~/data/db
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/wp
	@sudo hostsed add 127.0.0.1 jdoukhan.42.fr
	@cd ./srcs
	sudo docker compose -f ./srcs/docker-compose.yml up -d
	@cd -
	
clean:
	@sudo hostsed remove 127.0.0.1 jdoukhan.42.fr
	@cd ./srcs
	sudo docker compose -f ./srcs/docker-compose.yml down -v
	@cd -

re:
	@cd ./srcs
	@sudo hostsed add 127.0.0.1 jdoukhan.42.fr
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate
	@cd -

fclean: clean
	sudo docker system prune -af

.PHONY: all, clean, fclean, re

