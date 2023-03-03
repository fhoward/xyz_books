class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :isbn_13, :price, :publication_year, :image_url, :edition,:isbn_10
  
  attribute :publisher_name do |book|
    book.publisher.name
  end

  attribute :authors do |book|
    book.authors.map(&:full_name).join(', ')
  end
end
