# Sparta-NASA-API
## About the repository
This repository contains a REST API using Sinatra that consumes the NASA NeoWs API. The resource shown in the web application are the constellations in the night sky. there are also files that run tests for the application.

## Installation
Ensure that Ruby is installed. For more information go to https://www.ruby-lang.org/en/documentation/installation/
which will provide more information on how to install Ruby.

There are some environments that also need to be installed to ensure that the web application runs smoothly. You will need to install:
* PostgreSQL
  * https://www.postgresql.org/download/
* Homebrew
  * https://brew.sh
Once these are installed, make sure that PostgreSQL is running properly.

This repository uses a variety of Gems that help run tests on this application. To install the gems, in the terminal run
```
bundle install
```
and this will install all the gems required.

## Running the Web Application
Make sure to clone this repository. In the terminal run the command:
```
psql -f seed.sql
```
This runs the sql command to create a database and the table of constellations.
Once the database and table has been created, you can run the server locally by running ```rackup``` in the terminal. Then on the browser, type in the localhost address, which normally will be ```localhost:9292```. This should open up the web application.

## Running the Tests
To run the tests, just put ```rspec``` into the terminal. Make sure you are in the root file before running the command. This tests all the units and the API.

To test the user interface, put ```cucumber``` in the terminal and let the tests run. There will be one failure as the test is testing whether the resource can be deleted or not. You will have to change this in the '/features/lib/pages/index_page.rb' file. Change the DELETE_STAR_LINK_ID to another ID that exists already in the index page.
