init:
	makedir -p ./src
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
	docker compose exec db bash
sql:
	docker compose exec db bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'
