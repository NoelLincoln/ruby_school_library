# student.rb
require_relative 'person'

# Represents a student with an additional classroom.
class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def join_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def leave_classroom
    return unless @classroom

    @classroom.remove_student(self)
    @classroom = nil
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
