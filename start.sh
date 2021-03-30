#!/bin/bash

bundle install
rails webpacker:install
rails webpacker:compile
rails db:migrate
rails db:seed
rails s -b 0.0.0.0
