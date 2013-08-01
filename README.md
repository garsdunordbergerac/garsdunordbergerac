# Gars du Nord et de la Belgique, Bergerac

[![Build
Status](https://travis-ci.org/garsdunordbergerac/garsdunordbergerac.png?branch=feature/remove_summaries)](https://travis-ci.org/garsdunordbergerac/garsdunordbergerac)
[![Coverage
Status](https://coveralls.io/repos/garsdunordbergerac/garsdunordbergerac/badge.png?branch=master)](https://coveralls.io/r/garsdunordbergerac/garsdunordbergerac?branch=master)
[![Code
Climate](https://codeclimate.com/github/garsdunordbergerac/garsdunordbergerac.png)](https://codeclimate.com/github/garsdunordbergerac/garsdunordbergerac)

## Pre-requis

* postgresql
* rvm

## Installation 

* `cd config && ln -s database.yml.sample database.yml && cd -`
* `for task in create migrate; do for env in test development; do RAILS_ENV=$env rake db:$task; done; done`
* `rake db:seed`
* `rails s`
