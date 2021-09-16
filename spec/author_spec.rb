require './lib/book'
require './lib/author'



RSpec.describe Author do

  it "can create an author" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte).to be_an_instance_of(Author)
  end
  it "can access the authors name" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end
  it "can store authors books in an array" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.books).to eq([])
  end

  it "can create an instance of book" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre).to be_an_instance_of(Book)
  end

  it "can publish a book once written" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    charlotte_bronte.publish(jane_eyre)

    expect(charlotte_bronte.books).to eq([jane_eyre])

  end

  it "can take take just a books year for publication date" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    expect(villette).to be_an_instance_of(Book)
  end

  it "can publish the villette book" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    charlotte_bronte.publish(jane_eyre)
    charlotte_bronte.publish(villette)
    expect(charlotte_bronte.books.length).to eq(2)
  end

end
