# frozen_string_literal: true


# Represents the super class person
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age = 18, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

# Example usage:
person1 = Person.new(1)
puts "Person ID: #{person1.id}, Name: #{person1.name}, Age: #{person1.age}"
puts "Can use services? #{person1.can_use_services?}"

person2 = Person.new(2, 16, 'Alice', parent_permission: false)
puts "Person ID: #{person2.id}, Name: #{person2.name}, Age: #{person2.age}"
puts "Can use services? #{person2.can_use_services?}"
