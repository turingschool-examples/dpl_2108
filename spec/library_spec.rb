require './lib/library'
require './lib/author'

describe Library do
  before (:each) do
    @dpl = Library.new("Denver Public Library")
  end

  it 'exists' do
    expect(@dpl).to be_an_instance_of(Library)
  end

  it 'has attributes' do
    expect(@dpl.name).to eq("Denver Public Library")
    expect(@dpl.books).to eq([])
    expect(@dpl.authors).to eq([])
  end

  it 'can add authors' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    charlotte_bronte.publish(jane_eyre)
    charlotte_bronte.publish(professor)
    charlotte_bronte.publish(villette)
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    harper_lee.publish(mockingbird)

    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)

    expect(@dpl.authors).to eq([charlotte_bronte, harper_lee])
  end
end
