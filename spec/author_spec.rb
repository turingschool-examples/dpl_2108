require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do

  before(:each) do

    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                    last_name: "Bronte"})

  end

  it 'creates' do
    expect(@charlotte_bronte).to be_an_instance_of Author
  end

  it '#name' do
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it '#write' do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre).to be_an_instance_of Book
    expect(jane_eyre.title).to eq("Jane Eyre")
  end

  it '#publish' do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @charlotte_bronte.publish(jane_eyre)

    expect(@charlotte_bronte.books).to be_a(Array)
    expect(@charlotte_bronte.books).to eq([jane_eyre])

    villette = @charlotte_bronte.write("Villette", "1853")
    @charlotte_bronte.publish(villette)
    @charlotte_bronte.books

    expect(@charlotte_bronte.books).to be_a(Array)
    expect(@charlotte_bronte.books).to eq([jane_eyre, villette])

  end
end
