class Author

  def initialize(author_info)
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
  end

  def name
    @first_name + " " + @last_name
  end

end
