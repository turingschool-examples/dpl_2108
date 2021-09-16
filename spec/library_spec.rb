require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

describe Library do

  describe '#initialize' do
    it 'creates an instance of Library' do
      dpl = Library.new("Denver Public Library")

      expect(dpl).to be_an_instance_of(Library)
    end

    it 'has readable attributes' do
      dpl = Library.new("Denver Public Library")

      expect(dpl.name).to eq("Denver Public Library")
      expect(dpl.books).to eq([])
      expect(dpl.authors).to eq([])
    end
  end

  describe '#add_author' do
    it 'can add authors to the authors array' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    end

    it 'should populate the books array at the same time' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      charlotte_bronte.publish(jane_eyre)
      charlotte_bronte.publish(professor)
      charlotte_bronte.publish(villette)
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      harper_lee.publish(mockingbird)
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.books).to include(jane_eyre, professor, villette, mockingbird)
    end
  end

  describe '#publication_time_frame_for' do
    it 'returns the date range of publication for an author' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      charlotte_bronte.publish(jane_eyre)
      charlotte_bronte.publish(professor)
      charlotte_bronte.publish(villette)
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      harper_lee.publish(mockingbird)
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end

end
