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

    local_endpoint = http://127.0.0.1
    port = 5100

    - INDEX: [:local_endpoint]:[:port]/api/books
        -  http://127.0.0.1:5100/api/books 
    - SHOW:  [:local_endpoint]:[:port]/api/books/[ISBN_VALUE]
        - http://127.0.0.1:5100/api/books/978-1-89183-085-3
    - CONVERT ISBN: [:local_endpoint]:[:port]/api/convert_isbn?isbn=[ISBN_VALUE]
        - http://127.0.0.1:5100/api/convert_isbn?isbn=1603094547



* Explanation of project
    
    - Front End 

        - library and gem use
            - `vite_rails` gem: for integrating vue js
            - `axios` package: for API communication
            - `vue js` package: javascript framework
            - `bootstrap` css framework for design

        - Form Input Search 
            - Added validation for checking if valid isbn13
            - On isValidIsbn(val) method
                - Remove hypen
                - Calls calculateISBN13CheckDigit method
                    - on for loop: each char at isbn will be multiplied by 1(if even) and 3(if odd), then it will be summed
                    - the total sum of each char will be divided to 10 using % modulo operators to get the remainder
                    - the remainder is subtracted to 10 then the result will be divided to 10 using `%` modulo operator to get the remainder
                    - if the result is 10 return 0 else return the result
                - Check if length == 13
                - Regex checks if isbn 13 starts with 978 and last 10 digit is number only
                - The value of calculateISBN13CheckDigit will be use to check if the last digit is >= 0 or <= 9
                - IF ISBN13 found Search.vue Component will show
                    - Search.vue
                        - data view of Book
        - Explore Books
            - The data use is the http request on `api/books`. 
            - Added params[:limit] to be limited only to 3 books.
    - Back End

         - gem use
            - `rspec and shoulda` gem for basic testing on model
            - `jsonapi-serializer` gem for Fast JSON:API serializer on ruby objects
            - `sqlite3` database use 
        
        - model
            - validates:  for validating attribute before saving
            - has_many,belongs_to:  for association on each model
    
            - Author
                - has_many books through author_books since books can have same authors
                - before save the names will be formatted to lower_case
                - full_name method will concat the first_name or middle_name and last_name
                    - titleize capitalize the first character on text
            - Book 
                - attr_accessor used to define an attribute for object of Model which is not mapped with any column in database
                - before saving of isbn_13 hypen is removed.
                    - there are different position of hypen in isbn_13 e.g (978-1-60309-038-4, 978-1-891830-85-3)
        - controller
            - BookController
                - index for 'api/books' : list of all books
                - show 'api/books/:isbn_13': viewing of selected book
                - convert_isbn 'api/convert_isbn?isbn=params[:isbn]' show of converted isbn_13 to isbn 10 and vice versa
                - find_book : getting of book by its 'isbn_13'
                - check_isbn_13:
                    - checking of length == 13
                    - checking of isbn if starts with 978 and the rest 10 char is number
                    - checking if check_digit is >= 0 or <= 9
                - check_isbn_10:
                    - checking of length == 10
                    - checking of isbn if its 9 char are number and the last is 'X' or number 
                    - checking if check_digit is >= 0 or <= 9 
                - convert_to_isbn_10: use for converting and formatting its hypen on isbn_13
                - convert_to_isbn_13: use for converting and formatting its hypen on  isbn_10
                - last_digit_isbn_13: use for calculating last digit of isbn_13 if check_digit == 10 the value will be '0'
                    - on logic of calculating isbn_13
                        - multiply each char 1 if even 3 if odd
                        - sum multiplied value
                        - get remainder of sum divided to 10 by using modulo
                        - subtract remainder to ten to get the last digit
                - last_digit_isbn_10: use for calculating last digit of isbn_13 if check_digit == 10 the value will be 'X'
                    - on logic of calculating isbn_13
                        - multiply each char by descending from 10 to 2 
                        - sum multiplied value
                        - get remainder of sum divided to 11 by using modulo then subtract to 11
                        - get the remainder of subtracted remainder divided to 11 by using modulo




