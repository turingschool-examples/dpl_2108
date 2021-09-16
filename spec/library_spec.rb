# frozen_string_literal: true

require './lib/library'
require './lib/author'

RSpec.describe Library do
  before(:each) do
    @dpl = Library.new('Denver Public Library')
    @charlotte_bronte = Author.new({ first_name: 'Charlotte',
                                     last_name: 'Bronte' })
    @harper_lee = Author.new({ first_name: 'Harper',
                               last_name: 'Lee' })

    @jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
    @professor = @charlotte_bronte.write('The Professor', '1857')
    @villette = @charlotte_bronte.write('Villette', '1853')
    @mockingbird = @harper_lee.write('To Kill a Mockingbird', 'July 11, 1960')
    @charlotte_bronte.publish(@jane_eyre)
    @charlotte_bronte.publish(@professor)
    @charlotte_bronte.publish(@villette)
    @harper_lee.publish(@mockingbird)
  end

  it 'exists' do
    expect(@dpl).to be_a(Library)
  end

  it 'has attributes' do
    expect(@dpl.name).to eq('Denver Public Library')
    expect(@dpl.books).to eq([])
    expect(@dpl.authors).to eq([])
  end

  it 'can add authors and books' do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
    expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
  end

  it 'can return publication time frame' do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expected1 = { start: '1847',
                  end: '1857' }

    expected2 = { start: '1960',
                  end: '1960' }

    expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq(expected1)
    expect(@dpl.publication_time_frame_for(@harper_lee)).to eq(expected2)
  end

  it 'can check books out' do
    expect(@dpl.checkout(@mockingbird)).to eq(false)
    expect(@dpl.checkout(@jane_eyre)).to eq(false)

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.checkout(@jane_eyre)).to eq(true)
    expect(@dpl.checked_out_books).to eq([@jane_eyre])
    expect(@dpl.checkout(@jane_eyre)).to eq(false)

    @dpl.return(@jane_eyre)
    expect(@dpl.checked_out_books).to eq([])

    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@villette)
    expect(@dpl.checked_out_books).to eq([@jane_eyre, @villette])
  end

  it 'can return most popular book' do
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.return(@jane_eyre)
    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@villette)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)

    expect(@dpl.most_popular_book).to eq(@mockingbird)

    @dpl.return(@mockingbird)

    expect(@dpl.most_popular_book).to eq(@mockingbird)
  end
end
