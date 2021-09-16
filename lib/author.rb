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

  def write(title, publication_date)
    book_info = {
                 author_first_name: @first_name,
                 author_last_name: @last_name,
                 title: title,
                 publication_date: publication_date
                }
    Book.new(book_info)
  end

end
