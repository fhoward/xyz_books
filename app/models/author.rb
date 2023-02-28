class Author < ApplicationRecord
    # ○  Should always have a first name and last name.
    # ○ Can have a middle name/initial, but is not required.
    # ○ Can have many books.
    has_many :author_books, :dependent => :destroy
    has_many :books, :through => :author_books, :dependent => :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true

end
