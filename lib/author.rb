class Author

  def initialize(author_info)
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
    @book_array = []
  end

  def name
    @first_name + " " + @last_name
  end

  def books
    @book_array
  end

end
