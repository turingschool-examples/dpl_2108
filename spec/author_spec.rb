require './lib/book'
require './lib/author'

RSpec.describe Author do
  before :each do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

  end

  it "is an instance of Author" do
    expect(@charlotte_bronte).to be_an_instance_of(Author)
  end

  it "#name" do
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it "#books to be empty by default" do
    expect(@charlotte_bronte.books).to eq([])
  end

  it "#write" do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre.title).to eq("Jane Eyre")
  end

  it "#publish" do
    @charlotte_bronte.publish(jane_eyre)

    expect(@charlotte_bronte.books.to eq(jayne_eyre)
  end
end
