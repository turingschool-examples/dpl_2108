class Book
  attr_reader :title,
              :checked_out_count

  def initialize(info)
    @title              = info[:title]
    @first_name         = info[:author_first_name]
    @last_name          = info[:author_last_name]
    @publication_date   = info[:publication_date]
    @checked_out_count  = 0
  end

  def author
    @first_name + ' ' + @last_name
  end

  def publication_year
    @publication_date[-4..-1]
  end

  def checked_out
    @checked_out_count += 1
  end
end
