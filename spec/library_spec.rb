require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

describe Library do

  describe '#initialize' do
    it 'creates an instance of Library' do
      library = Library.new

      expect(library).to be_an_instance_of(Library)
    end
  end

end
