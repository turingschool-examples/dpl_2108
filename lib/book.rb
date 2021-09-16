class Book
  attr_reader :title, :publication_year

  def initialize(data)
    @author_first_name = data[:author_first_name]
    @author_last_name = data[:author_last_name]
    @title = data[:title]
    @publication_date = data[:publication_date]
  end

  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    date = @publication_date.split
    date.to_a

    2.times do
      date.delete_at(0)
    end
    date[0]
  end
end
