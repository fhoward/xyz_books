module BooksHelper
    def check_isbn_13(isbn)
        # delete hypen check if length = 13 and regex if start with 978 and the rest is number
        isbn = isbn.delete('-')
        return false unless isbn.length == 13
        return false unless isbn.match?(/^978\d{10}$/)

        # calculate last digit and check last digit if valid equal 10 or 0
        _check_digit = last_digit_isbn_13(isbn)
        _check_digit == 10 ? 0 : _check_digit
    end

    def check_isbn_10(isbn)
        # delete hypen, check length = 10 and regex 9 numbers are number and the last is X or number
        isbn = isbn.delete('-')
        return false unless isbn.length == 10
        return false unless isbn.match?(/^(\d{9}[\d|X])$/)

        # calculate last digit and check last digit if valid if its X or 0
        _check_digit = last_digit_isbn_10(isbn)
        _check_digit == 'X' ? 0 : _check_digit
    end

    def convert_to_isbn_10(isbn_13)
        # remove first 3 character in isbn '978' and its hypen 
        isbn = isbn_13[3..-2].gsub('-','')

        # calculate last character in isbn
        check_digit = last_digit_isbn_10(isbn)
        return "#{isbn[0]}-#{isbn[1..3]}-#{isbn[4..8]}-#{check_digit}"
    end

    def convert_to_isbn_13(isbn_10)    
        # Remove the hyphens and the last character
        isbn = "978#{isbn_10[0...-1].gsub('-','')}"

        # calculate last character in isbn
        check_digit = last_digit_isbn_13(isbn)
        return "#{isbn[0..2]}-#{isbn[3]}-#{isbn[4..8]}-#{isbn[9..11]}-#{check_digit}"
    end

    def last_digit_isbn_13(isbn)
        # if even multiply to 1 else 3
        sum = 0
        isbn.chars.each_with_index do |digit, index|
            i = 3
            if index.even?
                i = 1
            end
            sum += digit.to_i * i
        end
        # get the remainder
        check_digit = 10 - (sum % 10) 
        # check if == 10 change to 0
        check_digit_string = check_digit == 10 ? 0 : check_digit.to_s
        return check_digit_string
    end

    def last_digit_isbn_10(isbn)
        # multiply to its index by reverse 10,9,8 then sum
        sum = 0
        isbn.chars.each_with_index do |digit, index|
            sum += digit.to_i * (10 - index)
        end
        # get the remainder
        check_digit = (11 - sum % 11) % 11
        # check if == 10 change to X
        check_digit_string = check_digit == 10 ? "X" : check_digit.to_s
        return check_digit_string
    end
end
