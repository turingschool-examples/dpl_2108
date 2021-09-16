require 'rspec'
require 'book'
require 'author'

describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
  end
  describe '#initialize' do
    it 'exists' do
      expect(@charlotte_bronte).to be_an_instance_of Author
    end

    it 'has a name' do
      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'has books' do
      expect(@charlotte_bronte.books).to eq([])
    end
  end

  describe '#write' do
    it 'adds a new book instance' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(jane_eyre).to be_an_instance_of Book
    end

    it 'has a title' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(jane_eyre.title).to eq("Jane Eyre")
    end
  end

  describe '#publish' do
    it 'adds a writen book to books' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @charlotte_bronte.publish(jane_eyre)

      expect(@charlotte_bronte.books.first).to eq(jane_eyre)

      villette = @charlotte_bronte.write("Villette", "1853")
      @charlotte_bronte.publish(villette)

      expect(@charlotte_bronte.books.length).to eq(2)
      expect(@charlotte_bronte.books).to include(jane_eyre, villette)
    end
  end
end
