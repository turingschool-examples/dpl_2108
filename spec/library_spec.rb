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
  end

  describe '#publication_time_frame_for' do
    it 'returns a hash of the time frame' do
      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end
end
