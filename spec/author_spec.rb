require './lib/book'
require './lib/author'

RSpec.describe Author do

 it "it exists" do
   charlotte_bronte = Author.new({first_name: "Charlotte",
                                  last_name: "Bronte"})
   expect(charlotte_bronte).to be_an_instance_of(Author)
 end

it "displays author name" do
  charlotte_bronte = Author.new({first_name: "Charlotte",
                                 last_name: "Bronte"})
  expect(charlotte_bronte.name).to eq("Charlotte Bronte")
end

it "displays books as empty by default" do
  charlotte_bronte = Author.new({first_name: "Charlotte",
                                 last_name: "Bronte"})
  expect(charlotte_bronte.books).to eq([])
end

it "writes books with date and title" do
   charlotte_bronte = Author.new({first_name: "Charlotte",
                                  last_name: "Bronte"})

   charlotte_bronte.write("Jane Eyre", "October 16, 1847")
   @title = title
   @publication_date = publication_date
   data = {}
   data[:title] = @title
   data[:publication_date] = @publication_date
   jane_eyre = Book.new(data)
   expect(jane_eyre.title).to be("Jane Eyre")
   expect(jane_eyre.publication_date).to be("October 16, 1847")
  end


 it "adds published books to books array" do
   charlotte_bronte = Author.new({first_name: "Charlotte",
                                  last_name: "Bronte"})
   charlotte_bronte.write("Jane Eyre", "October 16, 1847")
   @title = title
   @publication_date = publication_date
   data = {}
   data[:title] = @title
   data[:publication_date] = @publication_date
  jane_eyre = Book.new(data)
  end
   charlotte_bronte.publish(jane_eyre)
   expect(charlotte_bronte.books).to eq([jane_eyre])
 end
