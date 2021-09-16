class Book

  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_year

  def initialize(book_info)
    @author_first_name = book_info[:author_first_name]
    @author_last_name = book_info[:author_last_name]
    @title = book_info[:title]
    @publication_year = pub_year(book_info[:publication_date])
  end

  def pub_year(pub_info)
    #date = ''
    pub_info.split(', ').find do |date_frag|
      date_frag.length <= 4
    end
  end

end
