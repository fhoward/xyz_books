class Author < ApplicationRecord
    # ○  Should always have a first name and last name.
    # ○ Can have a middle name/initial, but is not required.
    # ○ Can have many books.
    has_many :author_books, :dependent => :destroy
    has_many :books, :through => :author_books, :dependent => :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates_uniqueness_of :first_name, scope: :last_name
    before_save :format_name

    def full_name
        if middle_name.present?
            "#{first_name} #{middle_name}. #{last_name}".titleize
        else
            "#{first_name} #{last_name}".titleize
        end
    end

    def format_name
        self.first_name = first_name.downcase()
        self.last_name = last_name.downcase()
        self.middle_name = middle_name.downcase() if middle_name.present?
    end

end
