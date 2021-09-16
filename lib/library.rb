require_relative "author"
require_relative "book"

class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name              = name
    @books             = []
    @authors           = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten!
  end

  def publication_time_frame_for(author)
    start = author.books.min_by do |book|
      book.publication_year.to_i
    end
    finish = author.books.max_by do |book|
      book.publication_year.to_i
    end

  {start: start.publication_year, end: finish.publication_year}
  end

  def checkout(book)
    unless @books.include? book
      false
    else
      if @checked_out_books.include? book
        false
      else
        @checked_out_books << book
        book.checkout
        true
      end
    end
  end

  def return(book)
    if @checked_out_books.include? book
      @checked_out_books.delete book
    end
  end

  def most_popular_book
    @books.max_by do | book |
      book.checkouts
    end
  end
end