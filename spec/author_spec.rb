require 'rspec'
require './lib/book'
require './lib/author'

describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"})
  end

  it 'creates an instance of author' do

    expect(@charlotte_bronte).to be_a(Author)
  end

  describe '#name' do
    it 'returns name of author' do

      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    end
  end

  describe '#books' do
    it 'returns all books in an array, or empty array if no books' do

      expect(@charlotte_bronte.books).to eq([])
    end
  end
end
