class Book < ApplicationRecord
  # ○ Should always have a title, ISBN-13, list price, publication year, and publisher(relation).
  # ○ Can have an image URL and edition.
  # ○ Must have at least one author but can have many authors.
  belongs_to :publisher
  has_many :author_books, :dependent => :destroy
  has_many :authors, through: :author_books, :dependent => :destroy
 
  validates :title,:isbn_13,:price,:publication_year,:publisher_id, presence: true
  validates_presence_of :authors, message: "must have at least one author"
  validates_uniqueness_of :title,:isbn_13,case_sensitive: false

  attr_accessor :isbn_10

  before_save :format_isbn

  def format_isbn
    self.isbn_13 = isbn_13.gsub("-","")
  end


end
