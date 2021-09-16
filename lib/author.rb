class Author
  attr_reader :first_name,
              :last_name
              
  def initialize(author_info)
    @author_info = author_info
    @first_name = author_info[:first_name]
    @last_name = author_info[:first_name]
  end
end
