require './lib/author'
require './lib/book'

class Library
  attr_reader :name,
              :authors
  def initialize(name)
    @name = name
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def books
    books = []
    authors.each do |author|
      books << author.books
    end
    books.flatten!
  end

  def publication_time_frame_for(author)
    years = {}
    authors.each do |author|
      author.books.max_by do |book|
        years[:end] = book.publication_date
      end
    end
    authors.min_by do |author|
      years[:start] = book.publication_date
    end
    years
  end
end
