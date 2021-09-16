class Library

  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
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
end
