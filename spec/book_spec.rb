require 'rspec'
require './lib/book'

describe Book do

  before(:each) do

  @book_info = {
                author_first_name: "Harper",
                author_last_name: "Lee",
                title: "To Kill a Mockingbird",
                publication_date: "July 11, 1960"
               }

  end

  describe '#initialize' do
    it 'creates an instance of Book' do
      book = Book.new(@book_info)

      expect(book).to be_an_instance_of(Book)
    end

    it 'has readable attributes' do
      book = Book.new(@book_info)

      expect(book.author_first_name).to eq("Harper")
      expect(book.author_last_name).to eq("Lee")
      expect(book.title).to eq("To Kill a Mockingbird")
      expect(book.publication_year).to eq('1960')
    end
  end

  describe '#pub_year' do
    it 'returns date from a date string' do
      book = Book.new(@book_info)

      expect(book.pub_year('October 25th, 1955')).to eq('1955')
      expect(book.pub_year('2010')).to eq('2010')
    end
  end

end
