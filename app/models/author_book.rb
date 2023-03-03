class AuthorBook < ApplicationRecord
  # many to many connections with another model
  # belongs author not limited to one but needed to have one author
  # author has_many books
  belongs_to :author
  belongs_to :book
end
