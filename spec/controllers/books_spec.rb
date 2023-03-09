require 'rails_helper'

RSpec.describe Api::BooksController, type: :controller do
  it { should route(:get, '/api/books').to(action: :index) }
  it { should route(:get, '/api/books/978-1-60309-398-9').to(action: :show, isbn_13: '978-1-60309-398-9') }
  it { should route(:get, '/api/convert_isbn').to(action: :convert_isbn)}
end
