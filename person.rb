require_relative 'nameable'

# class person extends Nameable
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true, **additional_params)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []

    @additional_params = additional_params
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_book(book, date)
    rental = Rental.new(book, self, date)
    @rentals << rental
    book.add_rental(self, date)
    rental
  end

  def return_book(rental)
    @rentals.delete(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end

# student.rb
class Student < Person
end

# teacher.rb
class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization:, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # Override can_use_services? to always return true for teachers
  def can_use_services?
    true
  end
end
