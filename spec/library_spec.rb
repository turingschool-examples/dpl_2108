require './lib/library'
require './lib/author'

RSpec.describe Library do
  it 'exists' do
    dpl = Library.new("Denver Public Library")

    expect(dpl).to be_an_instance_of(Library)
  end

  it 'has attributes' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.name).to eq("Denver Public Library")
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end

  it 'can add authors' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    charlotte_bronte.publish(jane_eyre)
    charlotte_bronte.publish(professor)
    charlotte_bronte.publish(villette)

    expect(charlotte_bronte.books).to eq([jane_eyre,professor, villette])

  end
end
