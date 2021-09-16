require './lib/author'

class Library < Author
  attr_reader :name,
              :authors,
              :books

  def initialize(name)
    @name = name
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def books
    @books = []
    super.push(@books) 
  end
end
