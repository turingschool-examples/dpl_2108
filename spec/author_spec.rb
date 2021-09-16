require './lib/book'
require './lib/author'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                  last_name: "Bronte"})
  end

  it "exists" do
    expect(@charlotte_bronte).to be_an_instance_of(Author)
  end

  it "has a name" do
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it "has an empty array of books" do
    expect(@charlotte_bronte.books).to eq([])
  end

  it "can write and publish books" do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = @charlotte_bronte.write("Villette", "1853")

    expect(jane_eyre).to be_a(Book)
    expect(villette).to be_a(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
    
    @charlotte_bronte.publish(jane_eyre)
    @charlotte_bronte.publish(villette)

    expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
  end

end
