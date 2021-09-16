class Book
  attr_reader :title,
              :checkouts

  def initialize(info)
    @title              = info[:title]
    @author_first_name  = info[:author_first_name]
    @author_last_name   = info[:author_last_name]
    @publication_date   = info[:publication_date]
    @checkouts          = 0
  end

  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    year = @publication_date.split(" ")
    year.last
  end

  def checkout
    @checkouts += 1
  end
end