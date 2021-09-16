require './lib/library'
require './lib/author'
require './lib/book'

RSpec.describe Library do
  it 'exists' do
    dpl = Library.new("Denver Public Library")

    expect(dpl).to be_a(Library)
  end

  it 'has a name' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.name).to eq("Denver Public Library")
  end

  it 'starts with no books' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.books).to eq([])
  end

  it 'starts with no authors' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.authors).to eq([])
  end

  it 'can add books to author' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    charlotte_bronte.publish(jane_eyre)
    charlotte_bronte.publish(professor)
    charlotte_bronte.publish(villette)
    # I cant figure out how to directly connect the author.book instance variable to equal the library's collection of books
    expect(charlotte_bronte.books).to eq([jane_eyre, professor, villette])
  end

  it 'can add authors' do
    dpl = Library.new("Denver Public Library")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    harper_lee.publish(mockingbird)
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
  end
end
