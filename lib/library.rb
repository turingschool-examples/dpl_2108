class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name              = name
    @books             = []
    @authors           = []
    @checked_out_books = []
    @checkout_count    = Hash.new(0)
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    years = author.books.map do |book|
      book.publication_year.to_i
    end

    time_frame_hash = {start: years.min.to_s, end: years.max.to_s}

    time_frame_hash
  end

  def checkout(book)
    if @books.include?(book)
      @checked_out_books << book
      @books.delete(book)
      @checkout_count[book] += 1
      true
    else
      false
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
      @checked_out_books.delete(book)
      @books << book
    end
  end

  def most_popular_book
    most_popular = @checkout_count.max_by do |book, count|
      count
    end

    most_popular[0]
  end

end
