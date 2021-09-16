require './lib/book'
require './lib/author'

RSpec.describe Author do
  before(:each) do
    author_hash = ({
                    first_name: "Charlotte",
                    last_name: "Bronte"
                  })
    charlotte_bronte = Author.new(author_hash)
  end
