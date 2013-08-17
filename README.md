# Gars du Nord et de la Belgique, Bergerac

[![Build
Status](https://travis-ci.org/garsdunordbergerac/web.png?branch=master)](https://travis-ci.org/garsdunordbergerac/web)
[![Coverage
Status](https://coveralls.io/repos/garsdunordbergerac/web/badge.png?branch=master)](https://coveralls.io/r/garsdunordbergerac/web?branch=master)
[![Code
Climate](https://codeclimate.com/github/garsdunordbergerac/web.png)](https://codeclimate.com/github/garsdunordbergerac/web)

## Pre-requis

* postgresql
* rvm

## Installation

* `cd config && ln -s database.yml.sample database.yml && cd -`
* `for task in create migrate; do for env in test development; do RAILS_ENV=$env rake db:$task; done; done`
* `rake db:seed`
* `rails s`
