# student.rb

require_relative 'person'

# Represents a student with an additional classroom.
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    # Call the parent's constructor using super
    super(age,name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
