require './lib/book'

class Author
  attr_reader :first_name,
              :last_name,
              :books
  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, date)
    Book.new({first_name: @first_name,
              last_name: @last_name,
              title: title,
              date: date
            })
  end
end
