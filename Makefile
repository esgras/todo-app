postgres:
	@docker run --name=todo-db -v  $(pwd)/var/postgres:/var/lib/postgresql/data -e POSTGRES_PASSWORD=qwerty -p 5436:5432 -d --rm postgres

migrate-up:
	@migrate -path ./schema -database 'postgres://postgres:qwerty@localhost:5436/postgres?sslmode=disable' up

migrate-down:
	@migrate -path ./schema -database 'postgres://postgres:qwerty@localhost:5436/postgres?sslmode=disable' down

ssh-postgres:
	@docker exec -it todo-db bash

run:
	@go run cmd/main.go