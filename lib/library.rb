require './lib/book'

class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name               = name
    @books              = []
    @authors            = []
    @checked_out_books  = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    author.publication_range
  end

  def checkout(book)
    if
      @books.include?(book)
      book.times_checked_out += 1
      @checked_out_books << @books.delete(book)
      true
    else
      false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
    @books << book
  end

  def most_popular_book
    check = @checked_out_books + @books
    check.max_by do |book|
      book.times_checked_out
    end
  end
end
