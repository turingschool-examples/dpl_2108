class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    authors << author
    author.books.each do |book|
      books << book
    end
  end

  def publication_time_frame_for(author)
    {
      start: author.min_max_year[0],
      end:   author.min_max_year[1]
    }
  end

  def checkout(book)
    if books.include?(book)
      book.checked_out
      checked_out_books << book
      books.delete(book)
      true
    else
      books.include?(book)
    end
  end

  def return(book)
    if checked_out_books.include?(book)
      books << book
      checked_out_books.delete(book)
    end
  end

  def most_popular_book
    if most_popular_in_stock.checked_out > most_popular_checked_out.checked_out
      most_popular_in_stock
    else
      most_popular_checked_out
    end
  end

  def most_popular_in_stock
    if books.length >= 1
      books.max { |b1, b2| b1.checked_out <=> b2.checked_out }
    else
      books.first
    end
  end

  def most_popular_checked_out
    if checked_out_books.length >= 1
      checked_out_books.max { |b1, b2| b1.checked_out <=> b2.checked_out }
    else
      checked_out_books.first
    end
  end
end
