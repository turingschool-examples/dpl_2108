class Author
  attr_reader :name, :books
  def initialize(info)
    @name = info[:first_name] + " " + info[:last_name]
    @info = info
    @books = []
  end
  def write(title, publication_date)
    data = ({author_first_name: @info[:first_name], author_last_name: @info[:last_name], title: title, publication_date: publication_date})
    Book.new(data)
  end
  def publish(book)
    @books << book
  end
end
