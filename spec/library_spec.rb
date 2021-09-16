require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe do

  it 'exists' do
    dpl = Library.new("Denver Public Library")
    expect(dpl).to be_an_instance_of(Library)
  end

  it 'can add books' do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({
                          first_name: "Charlotte",
                          last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    dpl.publish(jane_eyre)
    dpl.publish(professor)
    dpl.publish(villette)

    expect(dpl.books).to eq([jane_eyre, professor, villette])
  end

  it 'can add authors' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({
                      first_name: "Charlotte",
                      last_name: "Bronte"})
    harper_lee = Author.new({
                      first_name: "Harper",
                      last_name: "Lee"})

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
  end
end
