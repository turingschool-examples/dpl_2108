class Author
  attr_reader :first_name,
              :last_name,
              :name,
              :books,
              :title,
              :publication_date

  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @books = []
  end

  def name
    @name = @first_name + " " + @last_name
  end

  def write(title, publication_date)
    @title = title
    @publication_date = publication_date
    data = {}
    data[:title] = @title
    data[:publication_date] = @publication_date
    jane_eyre = Book.new(data)
  end

  def publish(title)
    @books << title
  end

end
