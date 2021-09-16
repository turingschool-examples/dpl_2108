require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

describe Library do
  it 'exists' do
    dpl = Library.new("Denver Public Library")
    expect(dpl).to be_an_instance_of(Library)
  end

  it 'attributes' do
    dpl = Library.new("Denver Public Library")
    expect(dpl.name).to eq("Denver Public Library")
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end

  xit 'does things' do
  end
end
