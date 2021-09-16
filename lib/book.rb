class Book
attr_reader :author_first_name,
:author_last_name, :title, :date_of_publication

  def initialize(data)
  @author_first_name = data[:author_first_name]
  @author_last_name = data[:author_last_name]
  @title = data[:title]
  @date_of_publication = data[:date_of_publication]
  end

  def author_name
    author_first_name + ' ' + author_last_name
  end

  def year_published
    date_of_publication[-4..-1]
  end
end
