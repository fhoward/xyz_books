class BooksSerializer
  include JSONAPI::Serializer
  attributes :title, :isbn_13, :isbn_10, :price, :publication_year, :image_url, :edition, :publisher, :authors
end
