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
    require "pry"; binding.pry
    @books.flatten
  end

  def publication_time_frame_for(name)

  end
end
