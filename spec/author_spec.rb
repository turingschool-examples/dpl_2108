RSpec.describe Author do
  it 'exist' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte).to be_a(Author)
  end

  it 'has a name' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'has books' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    expect(charlotte_bronte.books).to eq([])
  end
end
