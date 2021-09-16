class Library

  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten!
  end

  def publication_time_frame_for(author)
    time_frame = {:start =>
      (author.books.min_by do |book|
        book.publication_year.to_i
      end).publication_year.to_s ,
      :end => (author.books.max_by do |book|
        book.publication_year.to_i
      end).publication_year.to_s}
    time_frame
  end

# def checkout(book)
#   if @checked_out_books == [] && @books.any?(book)
#     @checked_out_books << book
#      return true
#    else
#      return false
#    end
#  end

#  def return(book)
#
#  end
#
#  def most_popular_book
#
#  end
end
