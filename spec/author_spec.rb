require 'rspec'
require './lib/book'
require './lib/author'

describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
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

  describe '#write' do
    it 'writes a new book' do

      expect(@jane_eyre).to be_a(Book)
      expect(@jane_eyre.title).to eq("Jane Eyre")
    end
  end

  describe '#publish' do
    it 'publishes a book to the author books array' do
      @charlotte_bronte.publish(@jane_eyre)

      expect(@charlotte_bronte.books).to eq([@jane_eyre])

      villette = @charlotte_bronte.write("Villette", "1853")
      @charlotte_bronte.publish(villette)

      expect(@charlotte_bronte.books).to eq([@jane_eyre, villette])
    end
  end
end
