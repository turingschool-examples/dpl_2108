require './lib/book'
require './lib/author'

RSpec.describe Author do
  it 'exists' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                            last_name: "Bronte"})

  expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has a name' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                            last_name: "Bronte"})

  expect(charlotte_bronte.name).to eq('Charlotte Bronte')
  end

  it 'has no books by default' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                            last_name: "Bronte"})
    books = []
  expect(charlotte_bronte.books).to eq([])
  end

  xit 'can write books' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                            last_name: "Bronte"})
    books = []
    # jane_eyre = Book.new({title: 'Jane Eyre',
    #                       author_first_name: 'Charlotte',
    #                       author_last_name: 'Bronte',
    #                       publication_date: 'October 16, 1847'})
    #
    # jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

  expect(charlotte_bronte.write).to eq('Jane Eyre', 'October 16, 1847')

  end
end



# The write method must take two Strings as arguments and return an instance of Book.

# pry(main)> jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
# #=> #<Book:0x00007fb896e22538...>
#
# pry(main)> jane_eyre.title
# #=> "Jane Eyre"
#
# pry(main)> charlotte_bronte.publish(jane_eyre)
#
# pry(main)> charlotte_bronte.books
# #=> [#<Book:0x00007fb896e22538...>]
#
# pry(main)> villette = charlotte_bronte.write("Villette", "1853")
# #=> #<Book:0x00007fb8980aaca0...>
#
# pry(main)> charlotte_bronte.publish(villette)
#
# pry(main)> charlotte_bronte.books
# #=> [#<Book:0x00007fb896e22538...>, #<Book:0x00007fb8980aaca0...>]
