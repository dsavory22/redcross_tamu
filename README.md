# TAMU Red Cross Org Management

Student organization management app created with Ruby and PostgreSQL.

## Table of Contents

1. [Introduction](#introduction)
2. [Requirements](#requirements)
3. [External Deps](#external-deps)
4. [Installation](#installation)
5. [Tests](#tests)
6. [Execute Code](#execute-code)
7. [Deployment](#deployment)
8. [Support](#support)

## Introduction ##

Our client is the American Red Cross Club of TAMU and the officers are currently facing difficulties in organizing and accessing their information from using many shared documents, drives, and emails. Therefore, the problem is a lack of a proper management system to track their members participation, budgeting, and important documents.

The purpose of this web-based application is to help our clients manage and store information about their members, events, and budget and provide functionalities that assist the officers in their needs.

## Requirements ##

This code has been run and tested on:

- Ruby 3.0.2
- Rails 6.1.7
- Ruby Gems - Listed in `Gemfile`
- PostgreSQL 13.3

## External Deps ##

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##
Download this code repository by using git:
```
git clone https://github.com/dsavory22/redcross_tamu.git
```
## Tests ##

This project was tested using rspec for unit and integration testing as well as SimpleCov to determine code coverage.

To run the test suite, run `rspec .` in the root directory of the project.

## Execute Code ##

Run the following code in terminal if using Linux/Mac.

`cd redcross_tamu`

`docker run --rm -it --volume "$(pwd):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

For windows replace (pwd) -> {PWD} and run in Powershell.

`docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

Install the app:
```
bundle install
rails webpacker:install
rails db:create
rails db:migrate
```

Run the app:
```
rails server --binding=0.0.0.0
```

The application can be seen using a [browser](http://127.0.0.1:3000/).

## Deployment ##

A production application has been deployed to Heroku using a pipeline that automatically deploys from our main and test branch after each merge.

- [Staging App](https://redcross-tam-test-jv2srj3tckia.herokuapp.com/)
- [Production App](https://stage-test-redcross.herokuapp.com/)

## Support ##

Admins looking for support can reach out to the Product Owner chasecason@tamu.edu. Users looking for help seek out assistance from the customer.
