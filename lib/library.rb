require './lib/book'
require './lib/author'

class Library

  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author

    @authors.each do |author|
      @author.books.each do |book|
          @books << book
      end
    end
  end

  def publication_time_frame_for(author)

    min = 0
    max = 0

    author.books.each do |book|
        if book.publication_year.to_i < min
          min = book.publication_year.to_i
        elsif book.publication_year.to_i > max
          max = book.publication_year.to_i
        end

    time_frame = {start: min.to_s, end: max.to_s}
  end
end
