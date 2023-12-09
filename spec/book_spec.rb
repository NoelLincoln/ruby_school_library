require_relative '../book'
require_relative '../person'
require 'rspec'
require 'date'

describe Book do
  describe '#initialize' do
    it 'creates a new book' do
      book = Book.new('Linguistics', 'Filbert')
      expect(book).to be_a(Book)
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      book = Book.new('Swahili', 'Daniel')
      expect(book.title).to eq('Swahili')
    end
  end

  describe '#author' do
    it 'returns the correct author name' do
      book = Book.new('French', 'Bryant')
      expect(book.author).to eq('Bryant')
    end
  end

  describe '#add_rental' do
    it 'adds a new rental' do
      book = Book.new('French', 'Bryant')
      person = Person.new('Noel', 27)
      rental_date = Date.new(2023, 12, 12)
      book.add_rental(person, rental_date)

      expect(book.rentals.length).to eq(1)
      expect(person.rentals.first.book).to eq(book)
      expect(person.rentals.first.date).to eq(rental_date)
    end
  end

  describe '#rentals' do
    it 'returns the correct rentals' do
      book = Book.new('French', 'Bryant')
      expect(book.rentals).to eq([])
    end
  end

  describe '#to_hash' do
    it 'returns the correct hash representation' do
      book = Book.new('DSA', 'Noel')
      rental_date = Date.new(2019, 4, 1)
      person = Person.new('29', 'Noel')
      book.add_rental(person, rental_date)

      expected_hash = {
        'title' => 'DSA',
        'author' => 'Noel',
        'rentals' => [
          {
            'date' => rental_date.to_s,
            'book_title' => 'DSA',
            'person_name' => 'Noel'
          }
        ]
      }

      expect(book.to_hash).to eq(expected_hash)
    end
  end
end
