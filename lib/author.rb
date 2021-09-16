class Author
  attr_reader :first_name,
              :last_name,
              :name,
              :books
  def initialize(author_data)
    @first_name = author_data[:first_name]
    @last_name  = author_data[:last_name]
    @name       = author_data[:first_name] + " " + author_data[:last_name]
    @books      = []
  end

  def write(name, books)
  end
end
