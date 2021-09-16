class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name    = name
    @books   = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    added_books(author)
  end

  def added_books(author)
    @books += author.books
  end
end
