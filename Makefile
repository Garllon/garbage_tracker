setup:
	docker-compose build web
	docker-compose run web rake db:create
	docker-compose run web rake db:migrate

devserver:
	docker-compose up web

console:
	docker-compose run web rails c
