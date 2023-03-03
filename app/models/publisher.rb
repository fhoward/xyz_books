class Publisher < ApplicationRecord
  # ○ Should always have a name.
  # ○ Can have many books.
  validates :name, presence: true
  has_many :books, :dependent => :destroy
end