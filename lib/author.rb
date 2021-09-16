class Author
  attr_reader :name,
              :books

  def initialize(data)
    @name  = (data[:first_name] + " " + data[:last_name])
    @books = []
  end

  def write(str1, str2)
    attributes = {
      author_first_name: (@name.split[0]),
      author_last_name: (@name.split[1]),
      title: str1,
      publication_date: str2
    }
    Book.new(attributes)
  end

  def publish(book)
    @books << book
  end
end
