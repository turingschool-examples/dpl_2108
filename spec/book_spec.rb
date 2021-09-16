require 'rspec'
require './lib/book'

describe Book do

  it 'exists' do

    book = Book.new({author_first_name: "Harper", author_last_name: "Lee",
            title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    expect(whatever).to be_an_instance_of(Whatever)
  end

  it 'has readable attributes' do

    book = Book.new({author_first_name: "Harper", author_last_name: "Lee",
            title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    expect(book.title).to eq('To Kill a Mockingbird')
    expect(book.author).to eq("Harper Lee")

  end

  it 'returns publication year' do

    book = Book.new({author_first_name: "Harper", author_last_name: "Lee",
            title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    expect(book.publication_year).to eq('1960')

  end
end
