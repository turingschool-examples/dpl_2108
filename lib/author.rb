class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(author_info)
    @author_info = author_info
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
    @books = []

  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, publication_date)
    book = Book.new({title: title, publication_date: publication_date})
  end

  def publish(book)
    @books << (book)
  end
end
