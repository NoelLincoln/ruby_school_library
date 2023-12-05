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
    rental = Rental.new(self, person, date)
    @rentals << rental
    person.add_rental(rental)
  end
end
