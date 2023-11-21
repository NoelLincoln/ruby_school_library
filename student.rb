# student.rb

require_relative 'person'

# Represents a student with an additional classroom.
class Student < Person
  attr_reader :classroom

  def initialize(id, age = 18, name = 'Unknown', parent_permission: true, classroom: 'Ruby')
    # Call the parent's constructor using super
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
