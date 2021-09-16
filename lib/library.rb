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
end
