require './lib/library'
require './lib/author'

RSpec.describe do
  it "exists" do
    dpl = Library.new("Denver Public Library")

    expect(dpl).to be_an_instance_of(Library)
  end

  it "has a name" do
    dpl = Library.new("Denver Public Library")

    expect(dpl.name).to eq("Denver Public Library")
  end

  it "has a list of books" do
    dpl = Library.new("Denver Public Library")

    expect(dpl.books).to eq([])
  end

   it "has a list of authors" do
     dpl = Library.new("Denver Public Library")

     expect(dpl.authors).to eq([])
  end
end

# charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
# #=> #<Author:0x00007fbeea2d78b8...>
# jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
# #=> #<Book:0x00007fbeeb3beca8...>
# professor = charlotte_bronte.write("The Professor", "1857")
# #=> #<Book:0x00007fbeea8efd90...>
# villette = charlotte_bronte.write("Villette", "1853")
# #=> #<Book:0x00007fbeea24fbe8...>
#
# charlotte_bronte.publish(jane_eyre)
# charlotte_bronte.publish(professor)
# charlotte_bronte.publish(villette)
#
# harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
# #=> #<Author:0x00007fbeea112730...>
# mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
# #=> #<Book:0x00007fbeeb1089f0...>
#
# harper_lee.publish(mockingbird)
# dpl.add_author(charlotte_bronte)
# dpl.add_author(harper_lee)
# dpl.authors
# => [#<Author:0x00007fbeea2d78b8...>, #<Author:0x00007fbeea112730...>]
# dpl.books
# => [#<Book:0x00007fbeeb3beca8...>, #<Book:0x00007fbeea8efd90...>, #<Book:0x00007fbeea24fbe8...>, #<Book:0x00007fbeeb1089f0...>]
# dpl.publication_time_frame_for(charlotte_bronte)
# #=> {:start=>"1847", :end=>"1857"}
# dpl.publication_time_frame_for(harper_lee)
# #=> {:start=>"1960", :end=>"1960"}
