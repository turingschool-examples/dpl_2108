require './lib/book.rb'

class Author
  attr_reader :name,
              :books,
              :book

  def initialize(info)
    @name   = info[:first_name] + " " + info[:last_name]
    @books  = []
  end

  def write(title, date)
  end


  # def write(new_title, new_date)
  #   @new_book = Book.new(new_title, new_date)
  # end

  # def publish
  #   @books  #<< need above method to work
  # end

end
