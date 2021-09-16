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

    it 'has readable attributes_2' do
      book_info_2 = {
                    author_first_name: "Jacob",
                    author_last_name: "Yar",
                    title: "test",
                    publication_date: "1965"
                   }
      book_2 = Book.new(book_info_2)

      expect(book_2.author_first_name).to eq("Jacob")
      expect(book_2.author_last_name).to eq("Yar")
      expect(book_2.title).to eq("test")
      expect(book_2.publication_year).to eq("1965")
    end
  end

end
