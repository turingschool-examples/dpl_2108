require 'rspec'
require './lib/book'

describe Book do
  before(:each) do
    @book = Book.new({
      author_first_name: "Harper",
      author_last_name: "Lee",
      title: "To Kill a Mockingbird",
      publication_date: "July 11, 1960"
      })
  end

  it 'creates an instance of book' do

    expect(@book).to be_a(Book)
  end

  describe '#title' do
    it 'returns the title of the book' do

    expect(@book.title).to eq()
    end
  end

  describe '#author' do
    it 'returns the author of the book' do

    expect(@book.author).to eq()
    end
  end

  describe '#publication_year' do
    it 'returns the publication year of the book' do

    expect(@book.publication_year).to eq()
    end
  end
end
