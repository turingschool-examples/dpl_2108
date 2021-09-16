require './lib/book'

class Author
  attr_reader :first_name,
              :last_name,
              :name,
              :books
  def initialize(author_data)
    @first_name = author_data[:first_name]
    @last_name  = author_data[:last_name]
    @name       = author_data[:first_name] + " " + author_data[:last_name]
    @books      = []
  end

  def title
  end

  def publish

  end

  def write(title, publish)
    #this is doing what I want in pry but I can't make it work in atom
    # require "pry"; binding.pry
      @books << title
      @books << publish
  end


end
