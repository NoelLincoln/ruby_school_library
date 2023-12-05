# classroom class
class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Has-many side: a classroom has many students
  def add_student(student)
    @students << student
    student.classroom = self
  end

  # Remove a student from the classroom
  def remove_student(student)
    @students.delete(student)
    student.classroom = nil
  end
end
