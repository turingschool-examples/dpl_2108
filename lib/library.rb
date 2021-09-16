class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name     = name
    @books    = []
    @authors  = []
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
end
