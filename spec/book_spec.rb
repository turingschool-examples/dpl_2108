require 'rspec'
require './lib/whatever'

describe Whatever do
  it 'exists' do
    whatever = Whatever.new(what, ever)
    expect(whatever).to be_an_instance_of(Whatever)
  end

  it 'attributes' do
    whatever = Whatever.new(what, ever)
    expect(whatever.first_thing).to eq('what')
    expect(theater.second_thing).to eq('ever')
  end

  it 'does things' do
  end
end
