class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @authors = []
    @books = []
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
end
