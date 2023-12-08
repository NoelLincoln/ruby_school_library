# frozen_string_literal: true

# rental class
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def to_hash
    {
      'date' => @date.to_s, # Convert date to string for JSON serialization
      'book_title' => @book.title,
      'person_name' => @person.name
      # Add more attributes as needed
    }
  end
end
