require_relative 'rental'

# book class
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Has-many side: a book has many rentals
  def add_rental(person, date)
    Rental.new(date, self, person)
    end

  def to_hash
    {
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals.map(&:to_hash)
    }
  end
end
