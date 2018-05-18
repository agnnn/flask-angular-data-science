.PHONY: install install-backend install-frontend run run-backend run-frontend network

## Install the apps for regular use (non-development)
install:
	docker-compose up

## Installs the backend app
install-backend:
	cd backend && docker build -t backend-flask .

## Installs the frontend app
install-frontend:
	cd frontend && docker build -t frontend-angular .

## Run the two applications following the docker-compose.yml
run:
	docker-compose up

## Runs the backend
run-backend:
	docker run --network=data-science-demo -it --rm -p 8081:8081 --name backend backend-flask

## Runs the frontend
run-frontend:
	docker run --network=data-science-demo -it --rm -p 4200:4200 --name frontend frontend-angular

## Creates the bridged private network
network:
	docker network create data-science-demo

## Removes the bridged private network used for the containers
network-clean:
	docker network rm data-science-demo

## Cleans unused containers
containers-clean:
	docker container prune
