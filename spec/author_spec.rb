require './lib/book'
require './lib/author'

RSpec.describe do

  it "exists" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it "has a name" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it "has a collection of books" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.books).to eq([])
  end


  xit "can write books" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    # jane_eyre = Book.new{
    #           author_first_name: first_name,
    #           author_last_name: last_name,
    #           title: title,
    #           publication_date: publication_date}

    expect(jane_eyre.title).to eq("Jane Eyre")
  end

  xit "can publish books" do
    charlotte_bronte.publish(jane_eyre)
    expect(charlotte_bronte.books).to eq([jane_eyre])

    villette = charlotte_bronte.write("Villette", "1853")

    charlotte_bronte.publish(villette)
    expect(charlotte_bronte.books).to eq([jane_eyre, villette])
  end

end
