class Author

  attr_reader :name,
              :books

  def initialize(data)
    @name = "#{data[:first_name]} #{data[:last_name]}"
    @books = []
  end

  def write(title, publication_date)
    Book.new({:title => title, :publication_date => publication_date})
  end

  def publish(book)
    @books << book
  end
end
