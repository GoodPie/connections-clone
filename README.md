# README

## Description

This is a clone of [Connections by NYT games](https://www.nytimes.com/games/connections) built with Ruby on Rails. This
is intended to be a basic application to get myself used to the Rails framework.

## Installation

### Dependancies

- [Bun](https://bun.sh) - Building and bundling the JavaScript
- [Rails](https://rubyonrails.org) - The web framework used
- [PostgreSQL](https://www.postgresql.org) - The database used

### Running the application

1. Install the bundle
```shell
bin/rails bundle install 
```
2. Run the setup script 
``` shell
bin/rails setup
```
2. Build the JS 
``` shell
bun run build:js
```
3. Migrate and seed the database
``` shell
bin/rails db:migrate db:seed 
```
4. Start the development server
``` shell
bin/rails dev
```

