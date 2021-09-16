require './lib/book'

class Author
attr_reader :first_name,
:last_name, :book, :title, :date_of_publication

  def initialize(data)
  @first_name = data[:first_name]
  @last_name = data[:last_name]
  @books = []

  end

  def name
    @first_name + ' ' + @last_name
  end

  def books
    @books
  end


  def write(title, date_of_publication)
    book = Book.new({title: title, date_of_publication: date_of_publication})
  end

  def publish(book)
    books.append(book)
  end
end
