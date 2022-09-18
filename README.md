# TAMU Red Cross Org Management

Student organization management app created with Ruby and PostgreSQL.

## Table of Contents
1. [Introduction](#introduction)
2. [Technologies](#technologies)
3. [Setup](#setup)
4. [Testing](#testing)
5. [Deployment](#deployment)

## Introduction
Our client is the American Red Cross Club of TAMU and the officers are currently facing difficulties in organizing and accessing their information from using many shared documents, drives, and emails. Therefore, the problem is a lack of a proper management system to track their members participation, budgeting, and important documents.

The purpose of this web-based application is to help our clients manage and store information about their members, events, and budget and provide functionalities that assist the officers in their needs.

## Technologies
Project is created with:
* Ruby 3.0.2
* Rails 6.1.7
* Docker 20.10.17
* PostgreSQL 13.3

## Setup
### Install
Please install [Docker](https://docs.docker.com/desktop/install/windows-install/) for your device before continuing!

Download and run the docker image:
```
docker pull dmartinez05/ruby_rails_postgresql:latest
mkdir csce431
cd csce431
docker run --rm -it --volume "$(pwd):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest
```
For windows replace (pwd) -> {PWD}
```
docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest
```

### Run
To run this project, install it locally, navigate to the /csce431/redcross_tamu directory inside the Docker image, and run the following commands:
```
bundle install
rails db:create
rails db:migrate
rails server --binding=0.0.0.0
```

Now you can open the application in your [browser](http://127.0.0.1:3000/).

## Testing
* How to run the test suite

## Deployment
* Deployment instructions
