class Book
  attr_reader :title


  def initialize(info)
    @title = info[:title]
  end

  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    @publication_date
  end

end
