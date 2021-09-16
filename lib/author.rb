class Author

  attr_reader     :first_name,
                  :last_name,
                  :books

  def initialize(data)
    @first_name     = data[:first_name]
    @last_name      = data[:last_name]
    @books          = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, publication_date)
    book = Book.new(title, publication_date)
    book
  end

end
