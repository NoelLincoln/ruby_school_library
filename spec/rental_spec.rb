# frozen_string_literal: true

require_relative '../rental'
require_relative '../book'
require_relative '../person'
require 'date'
require 'rspec'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(25, 'John Doe') }
  let(:rental_date) { Date.new(2023, 1, 1) }

  describe '#initialize' do
    it 'creates a new rental' do
      rental = Rental.new(rental_date, book, person)
      expect(rental).to be_a(Rental)
    end

    it 'adds the rental to book and person rentals' do
      rental = Rental.new(rental_date, book, person)
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#to_hash' do
    it 'returns the correct hash representation' do
      rental = Rental.new(rental_date, book, person)
      expected_hash = {
        'date' => rental_date.to_s,
        'book_title' => 'The Great Gatsby',
        'person_name' => 'John Doe'
        # Add more attributes as needed
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end
end
