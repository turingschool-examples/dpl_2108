# frozen_string_literal: true

class Book
  attr_reader   :title
  attr_accessor :times_checked_out

  def initialize(data)
    @title              = data[:title]
    @author_first_name  = data[:author_first_name]
    @author_last_name   = data[:author_last_name]
    @publication_date   = data[:publication_date]
    @times_checked_out  = 0
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end

  def publication_year
    @publication_date.split(', ').last
  end
end
