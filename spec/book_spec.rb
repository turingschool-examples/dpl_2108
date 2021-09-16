require 'rspec'
require './lib/book'

describe 'Book' do

  it 'exists' do
    to_kill_a_mockingbird = Book.new({
      author_first_name: "Harper",
      author_last_name: "Lee",
      title: "To Kill A Mockingbird",
      date_of_publication: "July 11, 1960"
      })

  expect(to_kill_a_mockingbird).to be_a(Book)
  end

  it 'has an author' do
  to_kill_a_mockingbird = Book.new({
    author_first_name: "Harper",
    author_last_name: "Lee",
    title: "To Kill A Mockingbird",
    date_of_publication: "July 11, 1960"
    })

    expect(to_kill_a_mockingbird.author_name).to eq("Harper Lee")
  end

  it 'can tell you the year it was published' do
  to_kill_a_mockingbird = Book.new({
    author_first_name: "Harper",
    author_last_name: "Lee",
    title: "To Kill A Mockingbird",
    date_of_publication: "July 11, 1960"
    })

    expect(to_kill_a_mockingbird.year_published).to eq("1960")
  end  
end
