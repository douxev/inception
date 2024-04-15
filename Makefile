all:
	@sudo hostsed add 127.0.0.1 jdoukhan.42.fr
	sudo docker compose -f ./srcs/docker-compose.yml up
clean:
	@sudo hostsed remove 127.0.0.1 jdoukhan.42.fr
	sudo docker compose -f ./srcs/docker-compose.yml down -v

re:
	@sudo hostsed add 127.0.0.1 jdoukhan.42.fr
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate

fclean: clean
	sudo docker system prune -af

.PHONY: all, clean, fclean, re

