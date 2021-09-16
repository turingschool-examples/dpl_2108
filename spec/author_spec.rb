require 'rspec'
require './lib/book'
require './lib/author'

describe Author do
  it 'exists' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
       last_name: "Bronte"})

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has attributes' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
       last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end

  it 'can write a book' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
       last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre.title).to eq("Jane Eyre")
  end

  it 'can publish a book' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
       last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    charlotte_bronte.publish(jane_eyre)

    expect(charlotte_bronte.books).to eq([jane_eyre])

    villette = charlotte_bronte.write("Villette", "1853")

    charlotte_bronte.publish(villette)

    expect(charlotte_bronte.books).to eq([jane_eyre, villette])
  end




end
