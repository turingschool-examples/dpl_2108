require './lib/author'
require './lib/book'

class Library < Author
  attr_reader :name,
              :authors,
              :books

  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(author)
    @authors << author
  end

  def publication_time_frame_for(author)
    results = {start: publication_year.min, end: publication_year.max}
    authors.each do |author|
      publication_year

    end
  end
end
