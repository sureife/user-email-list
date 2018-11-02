app-build:
	docker-compose build

app:
	docker-compose up

app-start:
	docker-compose up

app-bash:
	docker-compose run --rm app bash

app-stop:
	docker-compose stop

app-initialise-docker:
	make app-install
	make app-db-prepare

app-install:
	docker-compose run --rm app bundle

app-test:
	docker-compose run --rm app rspec -fd

app-db-drop:
	docker-compose run --rm app rake db:drop

app-db-prepare:
	docker-compose run --rm app rake db:create
	docker-compose run --rm app rake db:migrate
