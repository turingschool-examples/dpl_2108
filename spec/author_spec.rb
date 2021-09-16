require './lib/book'
require './lib/author'

RSpec.describe Author do
  before(:each) do
    author_hash = ({
                    first_name: "Charlotte",
                    last_name: "Bronte"
                  })
    @charlotte_bronte = Author.new(author_hash)
  end

  it 'exists' do
    expect(@charlotte_bronte).to be_an_instance_of Author
  end

  it 'has readable attributes' do
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(@charlotte_bronte.books). to eq([])
end
