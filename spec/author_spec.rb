require './lib/book'
require './lib/author'

RSpec.describe Author do
  it 'exists' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"})

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has attributes' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end
end
