# Welcome to Cashback!
Hi! This project is a rails app made for you to make shopping easily.

## How it works
The client can see all the offers on the home page, and if he/she became interested in some offer, he/she can shop the offer. When the client click on an offer, we register on our website that the user has interest on that item, so we can confirm the offer purchase latter, and reward the user with a cashback.

## Tecnologies
The project uses `devise` gem for login, and `Postgres` for persistence. All the project was build using `Docker` and `Docker-Compose` for better development support.

## Building the project

`docker-compose build`

## Running the tests

`docker-compose run web rspec`

## Running the project
`docker-compose up`
The website will be available at `http://localhost:3000`

## Future features
By now there is no way to confirm an `reward` for the client, besides there is already a page listing all the `rewards` for the `client` with its respectively tests. We need to create a web hook listener that expects messages from our clients, so we can confirm it, and so it can be listed on the `rewards` page.