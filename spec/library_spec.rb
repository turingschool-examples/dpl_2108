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

end
