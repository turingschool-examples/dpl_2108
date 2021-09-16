class Author
  attr_reader :name,
              :books

  def initialize(names)
    @first_name = names[:first_name]
    @last_name  = names[:last_name]
    @name       = @first_name + ' ' + @last_name
    @books      = []
  end

  def write(title, date)
    Book.new({
      title: title,
      author_first_name: @first_name,
      author_last_name: @last_name,
      publication_date: date
    })
  end

  def publish(book)
    @books << book
  end
end
