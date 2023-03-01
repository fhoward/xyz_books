# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

    - ruby "3.1.2"
    - rails "~> 7.0.4", ">= 7.0.4.2"

* Configuration

    - bundle install

* Database creation

    - rails db:create

* Database initialization

    - rails db:migrate
    - rails db:seed

* How to run the test suite

    - rspec spec/models

* API Endpoint
    - INDEX: http://127.0.0.1:3000/books 
    - SHOW:  http://127.0.0.1:3000/books/[ISBN_VALUE]
    - CONVERT ISBN: http://127.0.0.1:3000/convert_isbn?isbn=[ISBN_VALUE]
