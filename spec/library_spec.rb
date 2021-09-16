require './lib/library'
require './lib/author'
require './lib/book'

RSpec.describe Library do
  it "can create a library" do
    dpl = Library.new("Denver Public Library")
    expect(dpl).to be_an_instance_of(Library)
  end

  it "can access the library name" do
    dpl = Library.new("Denver Public Library")

    expect(dpl.name).to eq("Denver Public Library")
  end
  it "can store books" do
    dpl = Library.new("Denver Public Library")
    expect(dpl.books).to eq([])
  end
  it "can store authors" do
    dpl = Library.new("Denver Public Library")

    expect(dpl.authors).to eq([])
  end

  it "can tell what authors are in the library" do
    dpl = Library.new("Denver Public Library")

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
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
  end

  it "can tell what books are in the library" do
    dpl = Library.new("Denver Public Library")

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
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
  end

  it "can tell you timeframe of publications for an author" do
    dpl = Library.new("Denver Public Library")
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
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
    expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
  end

  it "can checkout a book" do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    charlotte_bronte.publish(jane_eyre)
    charlotte_bronte.publish(villette)
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    harper_lee.publish(mockingbird)

    expect(dpl.checkout(mockingbird)).to eq(false)
    expect(dpl.checkout(jane_eyre)).to eq(false)

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    expect(dpl.checkout(jane_eyre)).to eq(true)


  end

  xit "can see checked out books" do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    charlotte_bronte.publish(jane_eyre)
    charlotte_bronte.publish(villette)
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    harper_lee.publish(mockingbird)


    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    dpl.checkout(jane_eyre)
    expect(dpl.checked_out_books).to eq([jane_eyre])

    expect(dpl.checkout(jane_eyre)).to eq(false)
  end







end
