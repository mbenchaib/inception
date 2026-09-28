inception: prepare
	docker compose -f srcs/docker-compose.yml up --build

prepare:
	mkdir -p ../data/mariadb_data
	mkdir -p ../data/wordpress_data


up:
	docker compose -f srcs/docker-compose.yml up

stop:
	docker compose -f srcs/docker-compose.yml stop

start:
	docker compose -f srcs/docker-compose.yml start

clean:
	docker compose -f srcs/docker-compose.yml down

fclean: clean
	docker compose -f srcs/docker-compose.yml down -v
	docker rmi nginx wordpress mariadb
	sudo rm -rf ../data

re: fclean inception

.PHONY: build_container stop start clean fclean re
