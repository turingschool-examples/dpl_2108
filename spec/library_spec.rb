require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

describe Library do
  it 'exists' do
    dpl = Library.new("Denver Public Library")
    expect(dpl).to be_an_instance_of(Library)
  end

  xit 'attributes' do
    whatever = Whatever.new(what, ever)
    expect(whatever.first_thing).to eq('what')
    expect(theater.second_thing).to eq('ever')
  end

  xit 'does things' do
  end
end
