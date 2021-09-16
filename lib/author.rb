require './lib/book'

class Author

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
  end
end
