# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

    - ruby "3.1.2"
    - rails "~> 7.0.4", ">= 7.0.4.2"
    - node v16.19.1
    - npm  v8.19.3
    - yarn v1.22.19
    
* Configuration

    - bundle install
    - yarn install

* Database creation

    - rails db:create

* Database initialization

    - rails db:migrate
    - rails db:seed

* How to run the test suite

    - rspec spec/models

* How to run app

    - foreman start -f Procfile.dev
    
* API Endpoint
    - INDEX: [:local_endpoint]/api/books 
    - SHOW:  [:local_endpoint]/api/books/[ISBN_VALUE]
    - CONVERT ISBN: [:local_endpoint]/api/convert_isbn?isbn=[ISBN_VALUE]
