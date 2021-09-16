require 'rspec'
require './lib/book'

describe Book do

  describe '#initialize' do
    it 'creates an instance of Book' do
      book = Book.new

      expect(book).to be_an_instance_of(Book)
    end
  end

end
