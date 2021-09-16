class Author
attr_reader :name,
            :books

  def initialize(name)
    @first_name = name[:first_name]
    @last_name = name[:last_name]
    @name = @first_name + ' ' + @last_name
    @books = []
  end

  def write(name, date)
    Book.new({
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: name,
      publication_date: date
    })
  end
end
