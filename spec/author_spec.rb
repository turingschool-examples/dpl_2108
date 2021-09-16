require 'rspec'
require './lib/book'
require './lib/author'

describe Author do
  before (:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  it 'exists' do

    expect(@charlotte_bronte).to be_a(Author)
  end

  it 'has attributes'do

    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'has books' do

    expect(@charlotte_bronte.books).to eq([])
  end

  it 'writes books' do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre).to be_a(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
  end

  it 'publishes' do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = @charlotte_bronte.write("Villette", "1853")

    @charlotte_bronte.publish(jane_eyre)
    @charlotte_bronte.publish(villette)

    expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
  end
end
