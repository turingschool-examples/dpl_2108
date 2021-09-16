require "rspec"
require "./lib/library"
require "./lib/author"
require './lib/book'

describe Library do
  before(:each) do
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
  it 'exists' do
    expect(@dpl).to be_a(Library)
  end

  it "#add_author" do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.authors).to include(@charlotte_bronte, @harper_lee)
    expect(@dpl.books).to include(@jane_eyre, @professor, @villette, @mockingbird)
  end

  it "#publication_time_frame_for" do
    expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
    expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
  end
end
  describe 'Iteration 4' do
    before(:each) do
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @charlotte_bronte.publish(@jane_eyre)
    @charlotte_bronte.publish(@villette)
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @harper_lee.publish(@mockingbird)
  end

  it "doesn't let you checkout a book not in the library" do
    @dpl.checkout(@mockingbird)
    @dpl.checkout(@jane_eyre)
  end

  it "lets you checkout books after added author" do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.checkout(@jane_eyre)
    expect(@dpl.checked_out_books).to include(@jane_eyre)
    expect(@dpl.checkout(@jane_eyre)).to be false
  end

  it '#return' do
    @dpl.add_author(@charlotte_bronte)
    @dpl.checkout(@jane_eyre)
    @dpl.return(@jane_eyre)
    expect(@dpl.checked_out_books).to eq([])
  end

  it 'can check out multiple books' do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@villette)
    expect(@dpl.checked_out_books).to include(@jane_eyre, @villette)
  end

  it '#most_popular_book' do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@villette)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)

    expect(@dpl.most_popular_book).to eq(@mockingbird)
  end
end
