require './lib/library'
require './lib/author'

RSpec.describe Library do
  it 'exists' do
    dpl = Library.new("Denver Public Library")

    expect(dpl).to be_an_instance_of(Library)
  end

  it 'has attributes' do
  end 
end
