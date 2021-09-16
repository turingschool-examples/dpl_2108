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
      author = Author.new(@author_info)

      expect(author).to be_an_instance_of(Author)
    end
  end

  describe '#name' do
    it 'returns the full author name' do
      author = Author.new(@author_info)

      expect(author.name).to eq("Charlotte Bronte")
    end 
  end

end
