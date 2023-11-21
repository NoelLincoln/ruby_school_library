require_relative 'person'

# Represents a teacher with additional specialization.
class Teacher < Person
  attr_reader :specialization

  def initialize(id, age, specialization, name = 'Unknown', parent_permission: true)
    # Call the parent's constructor using super
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # Override can_use_services? to always return true for teachers
  def can_use_services?
    true
  end
end
