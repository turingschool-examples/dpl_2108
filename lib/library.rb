class Library

  attr_reader :name,
              :authors

  def initialize(name)
    @name = name
    @book_array = []
    @authors = []
  end

  def add_author(name)
    @authors.push(name)
  end

  def books
    @authors.each do |author|
      author.books.each do |book|
        @book_array.push(book)
      end
    end
    @book_array
  end

end
