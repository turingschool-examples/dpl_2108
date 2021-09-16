#require './lib/book'

class Author

  attr_reader :name,
              :books

  def initialize(data)
    @name = "#{data[:first_name]} #{data[:last_name]}"
    @books = []
  end

  def write

  end
end
