require './lib/book'

RSpec.describe Book do

  it "exists" do
    book = Book.new({author_first_name: "Harper",
                     author_last_name: "Lee",
                     title: "To Kill a Mockingbird",
                     publication_date: "July 11, 1960"})

    expect(book).to be_an_instance_of(Book)
  end

  it "displays author_first_name, author_last_name, author_name" do
    book = Book.new({author_first_name: "Harper",
                     author_last_name: "Lee",
                     title: "To Kill a Mockingbird",
                     publication_date: "July 11, 1960"})

  expect(book.author_first_name).to eq("Harper")
  expect(book.author_last_name).to eq("Lee")
  expect(book.author_name).to eq("Harper Lee")
  end

  it "displays the book_title" do
      book = Book.new({author_first_name: "Harper",
                       author_last_name: "Lee",
                       title: "To Kill a Mockingbird",
                       publication_date: "July 11, 1960"})

      expect(book.title).to eq("To Kill a Mockingbird")
  end

  it "displays the publication year" do
      book = Book.new({author_first_name: "Harper",
                       author_last_name: "Lee",
                       title: "To Kill a Mockingbird",
                       publication_date: "July 11, 1960"})
  expect(book.publication_year).to eq("1960")
  end
end
