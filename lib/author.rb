class Author
  attr_reader :name,
              :books
  def initialize(info)
    @info = info
    @name = "#{info[:first_name]} #{info[:last_name]}"
    @books = []
  end

  def write(book_title, pub_date)
    Book.new({
                title: book_title,
                publication_date: pub_date
              })
  end

  def publish(book)
    @books << book
  end
end
