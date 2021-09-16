require "rspec"
require "./lib/author"
require './lib/book'

describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({
                                  first_name: "Charlotte",
                                  last_name: "Bronte"
                                   })
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  end
  it 'exists' do
    expect(@charlotte_bronte).to be_an(Author)
  end

  it 'attributes' do
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(@charlotte_bronte.books).to eq([])
  end

  it '#write' do
    expect(@jane_eyre.title).to eq("Jane Eyre")
  end

  it '#publish' do
    @charlotte_bronte.publish(@jane_eyre)
    expect(@charlotte_bronte.books).to eq([@jane_eyre])
    villette = @charlotte_bronte.write("Villette", "1853")
    @charlotte_bronte.publish(villette)
    expect(@charlotte_bronte.books).to eq([@jane_eyre, villette])
  end
end
