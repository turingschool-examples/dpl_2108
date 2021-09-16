require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

describe Library do
  before(:each) do
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @charlotte_bronte.publish(@jane_eyre)
    @charlotte_bronte.publish(@professor)
    @charlotte_bronte.publish(@villette)
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @harper_lee.publish(@mockingbird)
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

  describe '#add_author' do
    it 'adds author and their books to library' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
    end
  end

  describe '#publication_time_frame_for' do
    it 'returns the start and end time of author publication' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end

  describe '#checkout' do
    it 'checks out a book' do
      @dpl.add_author(@charlotte_bronte)
      chicken_little = Author.new({first_name: "Chicken", last_name: "Little"})
      chickens_and_planes = chicken_little.write("Chickens and Planes", "2010")

      expect(@dpl.checkout(chickens_and_planes)).to eq(false)
      expect(@dpl.checkout(@jane_eyre)).to eq(true)
      expect(@dpl.checkout(@jane_eyre)).to eq(false)
    end
  end

  describe '#checked_out_books' do
    it 'shows all checked out books' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      @dpl.checkout(@jane_eyre)

      expect(@dpl.checked_out_books).to eq([@jane_eyre])

      @dpl.checkout(@mockingbird)

      expect(@dpl.checked_out_books).to eq([@jane_eyre, @mockingbird])
    end
  end

  describe '#return' do
    it 'returns a book from being checked out' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      @dpl.checkout(@jane_eyre)
      @dpl.checkout(@mockingbird)

      @dpl.return(@mockingbird)

      expect(@dpl.checked_out_books).to eq([@jane_eyre])
      expect(@dpl.checkout(@mockingbird)).to eq(true)
    end
  end

  describe '#most_popular_book' do
    it 'returns the most popular book' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      @dpl.checkout(@jane_eyre)
      @dpl.checkout(@mockingbird)
      @dpl.return(@mockingbird)
      @dpl.checkout(@mockingbird)
      @dpl.return(@mockingbird)
      @dpl.return(@jane_eyre)
      @dpl.checkout(@jane_eyre)
      @dpl.checkout(@mockingbird)

      expect(@dpl.most_popular_book).to eq(@mockingbird)
    end
  end
end
