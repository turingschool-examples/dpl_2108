require './lib/author'
require './lib/book'

class Library
  attr_reader :name,
              :books,
              :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end
end
