class Author
  attr_reader :books

  def initialize(data)
    @first_name  = data[:first_name]
    @last_name  = data[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, publication_date)
    Book.new({title: title, publication_date: publication_date})
  end

  def publish(book)
    @books << book
  end

end
