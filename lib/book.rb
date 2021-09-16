class Book
  attr_reader :title,
              :author,
              :publication_year,
              :publication_date
  def initialize(info)
    @title  = info[:title]
    @author = info[:author_first_name] + " " + info[:author_last_name]
    @publication_year = info[:publication_date].split(', ').at(1)
    @publication_date = info[:publication_date]
  end
end
