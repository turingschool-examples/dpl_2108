class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(name)
    @authors << name
    (name.books).map {|book| @books << book}
  end

  def publication_time_frame_for(author)

    y = (author.books).max_by {|book| book.publication_year.to_i}
    x = (author.books).min_by {|book| book.publication_year.to_i}


    hash = {start: x.publication_year,
              end: y. publication_year
            }
  end

  def checkout(book_1)
    if books.find {|book| book == book_1}
      @checked_out_books << book_1
      return true
    else
      return false
    end
  end


end
