require 'rspec'
require './lib/book'
require './lib/author'

describe 'Author' do

  it 'exists' do
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

  expect(charlotte_bronte).to be_a(Author)
  end

  it 'has a name' do
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

  expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'has not written books by default' do
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

  expect(charlotte_bronte.books).to eq([])
  end

  it 'can write books' do
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

  expect(jane_eyre.title).to eq("Jane Eyre")
  end

  it 'can publish books' do
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  villette = charlotte_bronte.write("Villette", "1853")

  charlotte_bronte.publish(jane_eyre)
  charlotte_bronte.publish(villette)


  expect(charlotte_bronte.books).to include(jane_eyre)
  expect(charlotte_bronte.books).to include(villette)
  end
end
