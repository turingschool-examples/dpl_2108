class Book
  attr_reader :title,
              :author,
              :publication_year

  def initialize(data)
    @title            = data[:title]
    @author           = (data[:author_first_name] + " " + data[:author_last_name])
    @publication_date = data[:publication_date]
    @publication_year = only_year
  end

  def only_year
    if @publication_date.include?(',')
      year = @publication_date.partition(',').last
      year.strip
    else
      @publication_date
    end
  end
end
