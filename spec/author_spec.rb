require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do

  it 'is an instance of author' do
    charlotte_bronte = Author.new({
                      first_name: "Charlotte",
                      last_name: "Bronte"})

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has attributes' do
    charlotte_bronte = Author.new({
                      first_name: "Charlotte",
                      last_name: "Bronte"})

    charlotte_bronte.name
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end

  it 'can use input to write' do
    charlotte_bronte = Author.new({
                      first_name: "Charlotte",
                      last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    # jane_eyre = Book.new({
    #                 author_first_name: "Charlotte",
    #                 author_last_name: "Bronte",
    #                 title: "Jane Eyre",
    #                 publication_date: "October 16, 1847"})
    # expect(jane_eyre.title).to eq("Jane Eyre")
    # expect(jane_eyre.publication_date).to eq("October 16, 1847")

    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    expect(jane_eyre.write).to eq(Book.new("Jane Eyre", "October 16, 1847"))
  end

end
