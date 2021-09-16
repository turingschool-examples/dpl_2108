require "./lib/library"
require "./lib/author"
require "rspec"

describe Library do
  before :each do
    @dpl = Library.new("Denver Public Library")

    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")

    @charlotte_bronte.publish(@jane_eyre)
    @charlotte_bronte.publish(@professor)
    @charlotte_bronte.publish(@villette)

    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @harper_lee.publish(@mockingbird)
  end

  it "is a library" do
    expect(@dpl).to be_a Library
  end

  it "name" do
    expect(@dpl.name).to eq "Denver Public Library"
  end

  it "#add_author" do
    expect(@dpl.books).to eq []
    expect(@dpl.authors).to eq []

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.books.length).to eq 4
    expect(@dpl.authors.length).to eq 2
  end


  #this test doesn't work. It gives an incorrect number of arguments error, but when following the interaction pattern the method works properly and I have no idea why. 
  it "publication_time_frame_for" do
    # require "pry";binding.pry
    
    #these fuctions know that the authors exist and can call their objects
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    #but these somehow don't? I don't understand what's different here.
    expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq {start:"1847", end:"1857"}
    expect(@dpl.publication_time_frame_for(@harper_lee)).to eq {start:"1960", end:"1960"}
    #why does it work in pry but not here...
  end

  it "#checkout" do
    expect(@dpl.checkout(@mockingbird)).to be false
    expect(@dpl.checkout(@jane_eyre)).to be false
    
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.checkout(@jane_eyre)).to be true

    expect(@dpl.checked_out_books).to eq [@jane_eyre]

    expect(@dpl.checkout(@jane_eyre)).to be false
  end

  it "#return" do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    
    @dpl.checkout(@jane_eyre)
    
    expect(@dpl.checked_out_books).to eq [@jane_eyre]

    @dpl.return(@jane_eyre)

    expect(@dpl.checked_out_books).to eq []
  end

  it "#most_popular_book" do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    @dpl.checkout(@jane_eyre)
    @dpl.return(@jane_eyre)

    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@villette)

    expect(@dpl.checked_out_books).to eq [@jane_eyre, @villette]

    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)

    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)

    @dpl.checkout(@mockingbird)

    expect(@dpl.most_popular_book).to eq @mockingbird
  end
end