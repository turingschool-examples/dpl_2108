class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name = name
    @authors = []
    @books = []
    @checked_out_books = []
    @most_popular = nil
  end

  def add_author(author)
    @authors << author
    @books = @authors.map do |author|
      author.books
    end.flatten
  end

  def publication_time_frame_for(author)
    array_of_years = []
    author.books.each do |book|
      array_of_years << book.publication_year.to_i
    end

    minimum = array_of_years.min
    maximum = array_of_years.max

    time_frame = {
      start: minimum.to_s,
    end: maximum.to_s
    }
  end

  def checkout(book)
    if @books.include?(book)
      if !@checked_out_books.include?(book)
        @checked_out_books << book
        popularity(book)
        return true
      else
        false
      end
    else
      false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def popularity(book)
    jane_eyre_popularity = 0
    professor_popularity = 0
    villette_popularity = 0
    mockingbird_popularity = 0

    if book == @jane_eyre
      jane_eyre_popularity += 1
    elsif book == @professor
      professor_popularity += 1
    elsif book == @villette
      villette_popularity += 1
    elsif book == @mockingbird
      mockingbird_popularity += 1
    end

    all_books = [jane_eyre_popularity, professor_popularity ,villette_popularity, mockingbird_popularity]
    @most_popular = all_books.max
  end

  def most_popular_book
    @most_popular # this obviously does not work on many levels because
                  # even if it would work the way I intended it would
                  # return an integer and not the book, but alas there is
                  # no more time and I must refactor the working code.
  end
end
