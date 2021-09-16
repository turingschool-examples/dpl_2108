require 'rspec'
require './lib/book'
require './lib/author'

describe Author do

  before(:each) do

    @author_info = {
                    first_name: "Charlotte",
                    last_name: "Bronte"
                   }

  end

  describe '#initialize' do
    it 'creates an instance of Author' do
      charlotte_bronte = Author.new(@author_info)

      expect(charlotte_bronte).to be_an_instance_of(Author)
    end
  end

  describe '#name' do
    it 'returns the full author name' do
      charlotte_bronte = Author.new(@author_info)

      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end
  end

  describe '#write' do
    it 'creates a Book instance' do
      charlotte_bronte = Author.new(@author_info)
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(jane_eyre.title).to eq('Jane Eyre')
      expect(jane_eyre.publication_year).to eq('1847')
      expect(jane_eyre.author_first_name).to eq('Charlotte')
      expect(jane_eyre.author_last_name).to eq('Bronte')
    end
  end

  describe '#books' do
    xit 'returns an array of books the author wrote' do
      author = Author.new(@author_info)

      expect(charlotte_bronte.books).to eq([book_1, book_2])
    end
  end

end
