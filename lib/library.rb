require './lib/book'
require './lib/author'

class Library
  attr_reader :name,
              :authors,
              :books

  def initialize(name)
    @name     = name
    @books    = []
    @authors  = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten!
  end

  def first_book(author)
    author.books.min_by do |book|
      book.publication_year.to_i
    end
  end

  def last_book(author)
    author.books.max_by do |book|
      book.publication_year.to_i
    end
  end

  def publication_time_frame_for(author)
    first_book_year = first_book(author).publication_year
    last_book_year = last_book(author).publication_year

    {start: first_book_year, end: last_book_year}
  end
end
