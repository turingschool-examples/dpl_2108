class Library

  attr_reader :name,
              :authors

  def initialize(name)
    @name = name
    @book_array = []
    @authors = []
  end

  def add_author(name)
    @authors.push(name)
  end

  def books
    @authors.each do |author|
      author.books.each do |book|
        @book_array.push(book)
      end
    end
    @book_array
  end

  def publication_time_frame_for(author)
    return_hash = {}
    min_date = '9999999999999'
    max_date = ''
    author.books.each do |book|
      min_date = book.publication_year if book.publication_year.to_i < min_date.to_i
    end
    return_hash[:start] = min_date
    author.books.each do |book|
      max_date = book.publication_year if book.publication_year.to_i > max_date.to_i
    end
    return_hash[:end] = max_date
    return_hash
  end

end
