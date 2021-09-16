require 'rspec'
require 'book'
require 'author'
require 'library'

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
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dpl).to be_an_instance_of Library
    end

    it 'has a name' do
      expect(@dpl.name).to eq("Denver Public Library")
    end

    it 'has books' do
      expect(@dpl.books).to include(@jane_eyre, @professor, @villette, @mockingbird)
    end

    it 'has authors' do
      expect(@dpl.authors).to include(@charlotte_bronte, @harper_lee)
    end

    it 'has a list of checked out books' do
      expect(@dpl.checked_out_books).to eq([])
    end
  end

  describe '#publication_time_frame_for' do
    it 'returns a hash of the time frame' do
      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end

  describe '#checkout' do
    it 'checks out a book if it exists' do
      expect(@dpl.checkout(@jane_eyre)).to eq true
      expect(@dpl.checkout('this isnt a book')).to eq false
      expect(@dpl.checkout(@jane_eyre)).to eq false
      @dpl.checkout(@villette)
      expect(@dpl.checked_out_books.length).to eq(2)
    end
  end

  describe '#return' do
    it 'removes the book from checked_out_books' do
      @dpl.checkout(@mockingbird)
      @dpl.return(@mockingbird)
      expect(@dpl.checked_out_books).to eq([])
    end
  end

  describe '#most_popular_book' do
    xit 'returns the book that has been checked out the most' do
      10.times do
        @dpl.checkout(@mockingbird)
        @dpl.return(@mockingbird)
      end
      @dpl.checkout(@villette)
      @dpl.return(@villette)

      expect(@dpl.most_popular_book).to eq(@mockingbird)
    end
  end
end
