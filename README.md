# Data Science Web Application Tutorial

This repository is meant to demonstrate the use of Flask and Angular to build a simple, but state-of-the-art, web application which can be used for POCs.
Read the corresponding Medium article [here](https://medium.com/@dvelsner/deploying-a-simple-machine-learning-model-in-a-modern-web-application-flask-angular-docker-a657db075280).

## Clone/Fork repository

First fork or clone this repo:

e.g. `git clone https://github.com/chmstimoteo/flask-angular-data-science.git`
 

## Build images and run containers with docker-compose

After cloning the repository go inside the project folder:

`cd flask-angular-data-science`

Run `make install` which will start a Flask web application for the backend API (default port `8081`) and an Angular frontend served through a webpack development web server (default port `4200`).

## Build images and run containers separetely using a custom virtual private network

After cloning the repository go inside the project folder:

`cd flask-angular-data-science`

Run `make network` which will create a private network to run this application.

Run `make install-backend` which will build the Flask backend web application image container.

Run `make install-frontend` which will build the Angular frontend served through a webpack development web server.

Run `make run-backend` which will start the Flask web application for the backend API (default port `8081`).

Run `make run-frontend` which will start an Angular frontend served through a webpack development web server (default port `4200`).

By the end, run `make network-clean` which will remove the created private network to run this application.

## Access your app

In your browser navigate to: `http://localhost:4200` (or whatever port you defined for the frontend in `docker-compose.yml`).

For testing your backend API I recommend using [Postman](https://www.getpostman.com/).
  

## Working __without__ docker 

I highly recommend the use of docker and docker-compose as it is far simpler to get started than to run all of the following manually.


### Backend development

Navigate inside the backend directory: `cd backend`

Install pip dependencies: `pip install -r requirements.txt`

Run `python app.py` in backend root (will watch files and restart server on port `8081` on change).

### Frontend development

Navigate inside the frontend directory: `cd frontend`

Assure you have [Nodejs](https://nodejs.org/en/), [Yarn](https://yarnpkg.com/en/docs/install) and the [angular-cli](https://cli.angular.io/) installed.

Install npm dependencies: `yarn install --pure-lockfile` 

Run `yarn start` in frontend root (will watch files and restart dev-server on port `4200` on change).
All calls made to `/api` will be proxied to backend server (default port for backend `8081`), this can be changed in `proxy.conf.json`.
