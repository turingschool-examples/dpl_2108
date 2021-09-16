class Book
  attr_reader :title,
              :author_first_name,
              :author_last_name,
              :publication_date

  def initialize(book_data)
    @title             = book_data[:title]
    @author_first_name = book_data[:author_first_name]
    @author_last_name  = book_data[:author_last_name]
    @publication_date  = book_data[:publication_date]
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end

  def publication_year
    @publication_date.chars.last(4).join
  end
end
