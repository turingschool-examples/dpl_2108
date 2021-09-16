require 'rspec'
require './lib/book'
require './lib/author'

describe Author do
  it 'exists' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
       last_name: "Bronte"})

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  xit 'attributes' do
    whatever = Whatever.new(what, ever)
    expect(whatever.first_thing).to eq('what')
    expect(theater.second_thing).to eq('ever')
  end

  it 'does things' do
  end
end
