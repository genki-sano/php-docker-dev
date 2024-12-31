init:
	mkdir -p ./src
	touch ./src/index.php
	echo "<?php phpinfo();" > ./src/index.php
	cp .env.example .env
	@make build
	@make up
up:
	docker compose up -d
build:
	docker compose build
down:
	docker compose down
restart:
	@make down
	@make up
ps:
	docker compose ps
logs:
	docker compose logs
web:
	docker compose exec nginx bash
app:
	docker compose exec app bash
db:
	docker compose exec mysql bash
sql:
	docker compose exec mysql bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'
opcache-reset:
	docker compose exec app php -r 'opcache_reset(); echo "Opcache cleared\n";'
opcode:
	docker compose exec app php -d opcache.enable_cli=1 -d opcache.opt_debug_level=0x20000 index.php
