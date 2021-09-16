class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name  = info[:last_name]
    @books      = []
  end

  def name
    @first_name + ' ' + @last_name
  end


  def write(title, publication_date)
    Book.new({
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: publication_date
      })
  end

  def publish(book)
    @books << book
  end

end
