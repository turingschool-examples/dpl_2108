require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do
  before :each do
    @charlotte_bronte = Author.new({
      first_name: 'Charlotte',
      last_name: 'Bronte'
    })
  end

  context 'Instantiation' do
    it 'exists' do
      expect(@charlotte_bronte).to be_an Author
    end

    it 'has a #name' do
      expect(@charlotte_bronte.name).to eq 'Charlotte Bronte'
    end

    it 'starts with no books' do
      expect(@charlotte_bronte.books).to eq []
    end
  end

  context 'Methods' do
    it 'can #write books' do
      jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
      expect(jane_eyre).to be_a Book
      expect(jane_eyre.title).to eq 'Jane Eyre'
      expect(@charlotte_bronte.books).to eq []
    end

    it 'can #publish books' do
      jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
      @charlotte_bronte.publish(jane_eyre)

      expect(@charlotte_bronte.books).to eq [jane_eyre]

      villette = @charlotte_bronte.write('Villette', '1853')
      @charlotte_bronte.publish(villette)

      expect(@charlotte_bronte.books).to eq [jane_eyre, villette]
    end
  end
end
