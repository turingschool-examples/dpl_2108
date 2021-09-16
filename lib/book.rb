class Book
  attr_reader :title,
              :author
  def initialize(book_data)
    @book_data         = book_data
    @title             = book_data[:title]
    @author_first_name = book_data[:author_first_name]
    @author_last_name  = book_data[:author_last_name]
    @author            = book_data[:author_first_name] + " " + book_data[:author_last_name]
  end

  def publication_year
    @book_data[:publication_date].split(" ").last
  end
end
