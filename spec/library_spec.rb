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
  end

end
