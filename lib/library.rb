class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def books
    @authors.map do |author|
      @books << author.books
    end

    @books.flatten
  end

  def publication_time_frame_for(name)

    books = @authors.map do |author|
      author.books.map do|book|
        book.publication_year
      end
    end

    
  end
end
