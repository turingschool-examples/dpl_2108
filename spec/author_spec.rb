# frozen_string_literal: true

require './lib/book'
require './lib/author'

RSpec.describe 'Author' do
  before(:each) do
    @charlotte_bronte = Author.new({ first_name: 'Charlotte',
                                     last_name: 'Bronte' })
  end

  it 'exists' do
    expect(@charlotte_bronte).to be_a(Author)
  end

  it 'has attributes' do
    expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
    expect(@charlotte_bronte.books).to eq([])
  end

  it 'can write a book' do
    jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
    expect(jane_eyre).to be_a(Book)
    expect(jane_eyre.title).to eq('Jane Eyre')
  end

  it 'can publish' do
    jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
    @charlotte_bronte.publish(jane_eyre)

    expect(@charlotte_bronte.books).to eq([jane_eyre])

    villette = @charlotte_bronte.write('Villette', '1853')
    @charlotte_bronte.publish(villette)
    expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
  end

  it 'can return publication range' do
    jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
    @charlotte_bronte.publish(jane_eyre)

    expect(@charlotte_bronte.books).to eq([jane_eyre])

    villette = @charlotte_bronte.write('Villette', '1853')
    @charlotte_bronte.publish(villette)
    expect(@charlotte_bronte.publication_range).to eq({ start: '1847',
                                                        end: '1853' })
  end
end
