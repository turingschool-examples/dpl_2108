require './lib/library'
require './lib/author'

RSpec.describe Library do
  before(:each) do
    dpl = Library.new("Denver Public Library")
  end 
end
