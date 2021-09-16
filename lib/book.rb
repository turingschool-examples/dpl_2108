class Book
  attr_reader :title,
              :author_first_name,
              :author_last_name,
              :author_name,
              :publication_date

  def initialize(data)
    @title = data[:title]
    @author_first_name = data[:author_first_name]
    @author_last_name = data[:author_last_name]
    @publication_date = data[:publication_date]

  end

def author_name
  @author_name = @author_first_name + " " + @author_last_name
end

def publication_year
  @publication_date[9..13]
end


end
