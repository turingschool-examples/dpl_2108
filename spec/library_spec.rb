require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

describe Library do
  before(:each) do
    @dpl = Library.new("Denver Public Library")
  end

  it 'is an instance of Library' do

    expect(@dpl).to be_a(Library)
  end

  describe '#name' do
    it 'prints name of library' do

      expect(@dpl.name).to eq('Denver Public Library')
    end
  end

  describe '#books' do
    it 'prints all books in the library, or empty array if no books' do

      expect(@dpl.books).to eq([])
    end
  end

  describe '#books' do
    it 'prints all authors with books in library, or empty array if no authors' do

      expect(@dpl.authors).to eq([])
    end
  end
end
