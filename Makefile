setup:
	docker-compose build
	docker-compose run --rm web bundle exec rake db:create
	docker-compose run --rm web bundle exec rake db:migrate
	docker-compose run --rm web bundle exec rake db:seed

devserver:
	docker-compose up web

test:
	docker-compose run --rm web rspec spec

console:
	docker-compose run web rails c
