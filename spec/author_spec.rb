require "./lib/author"
require "./lib/book"
require "rspec"

describe Author do
  before :each do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  it "is an Author" do
    expect(@charlotte_bronte).to be_a Author
  end

  it '#name' do
    expect(@charlotte_bronte.name).to eq "Charlotte Bronte"
  end

  it "#write" do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre).to be_a Book
    expect(jane_eyre.title).to eq "Jane Eyre"
  end

  it "#publish" do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(@charlotte_bronte.books).to eq []
    
    @charlotte_bronte.publish(jane_eyre)

    expect(@charlotte_bronte.books).to eq [jane_eyre]

    villette = @charlotte_bronte.write("Villette", "1853")

    @charlotte_bronte.publish(villette)

    expect(@charlotte_bronte.books).to include villette
    expect(@charlotte_bronte.books.length).to eq 2
  end
end