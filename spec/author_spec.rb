require './lib/author'
require './lib/book'

RSpec.describe do
  it 'exists' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"
                                   })

    expect(charlotte_bronte).to be_an_instance_of(Author)
  end

  it 'has a name' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"
                                   })

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'has an empty array for books' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"
                                   })

    expect(charlotte_bronte.books).to eq([])
  end

  xit 'knows book name and publish date' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"
                                   })
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(charlotte_bronte.write).to eq(jane_eyre)
  end

  xit 'can identify titles' do
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"
                                   })
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(charlotte_bronte.title).to eq("Jane Eyre")
  end
end
