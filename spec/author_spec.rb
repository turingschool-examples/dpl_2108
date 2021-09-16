require 'rspec'
require './lib/book'
require './lib/author'

describe Author do

  describe '#initialize' do
    it 'creates an instance of Author' do
      author = Author.new

      expect(author).to be_an_instance_of(Author)
    end
  end

end
