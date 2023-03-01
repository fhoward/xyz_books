class BooksController < ApplicationController
  include BooksHelper
  before_action :find_book,only: :show
  # All authors of the book should be combined and provided as a single, comma-separated string (e.g., “author 1, author 2, author 3”).
  # The publisher’s name should be provided as an unnested object.
  
  def index
    @books = Book.all
    @books.map{ |i| i.isbn_10 = convert_to_isbn_10(i.isbn_13) }
    json_string = BooksSerializer.new(@books).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  def show
    if @book.present?
      @book.isbn_10 = convert_to_isbn_10(@book.isbn_13)
      json_string = BookSerializer.new(@book).serializable_hash.to_json
      render json: json_string,status: :ok
    else
      # The response code for a book that does not exist should be a 404.
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  def convert_isbn
    if check_isbn_10(params[:isbn])
      isbn_13 = convert_to_isbn_13(params[:isbn])
      render json: {isbn_13: isbn_13}, status: :ok
    elsif check_isbn_13(params[:isbn])
      isbn_10 = convert_to_isbn_10(params[:isbn])
      render json: { isbn_10: isbn_10},status: :ok
    else
      render json: { error: 'Invalid ISBN-13'}, status: :bad_request
    end
  end

  private

  def find_book
    #  The response code for a request with an invalid ISBN-13 should be 400.
    #  check if isbn13 is valid 
    isbn13_valid = check_isbn_13(params[:isbn_13])
    if isbn13_valid
      @book = Book.find_by(isbn_13: params[:isbn_13])
    else
      render json: { error: 'Invalid ISBN-13'}, status: :bad_request
    end
  end
end
