require 'rails_helper'

RSpec.describe Book, type: :model do
  
  describe 'associations' do
    it { should have_many(:authors).through(:author_books)}
    it { should belong_to(:publisher)}
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:isbn_13) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:publication_year) }
    it { should validate_presence_of(:publisher_id) }
    it { should validate_presence_of(:authors).with_message("must have at least one author") }
  end
end
