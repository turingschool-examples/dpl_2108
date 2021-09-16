require './lib/author'
require './lib/book'

class Library

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end
end
