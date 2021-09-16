require './lib/library'
require './lib/author'

RSpec.describe Library do
  before(:each) do
    @dpl = Library.new("Denver Public Library")
    author_hash = ({
                      first_name: "Charlotte",
                      last_name: "Bronte"
                    })
    @charlotte_bronte = Author.new(author_hash)

    author2_hash = ({
                      first_name: "Harper",
                      last_name: "Lee"
                    })
    @harper_lee = Author.new(author2_hash)
  end

  it 'exists' do
    expect(@dpl).to be_an_instance_of Library
  end

  it 'has readable attributes' do
    expect(@dpl.name).to eq("Denver Public Library")
    expect(@dpl.books).to eq([])
    expect(@dpl.authors).to eq([])
  end

  it 'can add authors' do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
  end

  it 'can add books' do
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @charlotte_bronte.publish(@jane_eyre)
    @charlotte_bronte.publish(@professor)
    @charlotte_bronte.publish(@villette)

    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @harper_lee.publish(@mockingbird)

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
  end
end
