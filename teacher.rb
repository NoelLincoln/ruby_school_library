require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id, age = 18, name = "Unknown", parent_permission = true, specialization)
    # Call the parent's constructor using super
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  # Override can_use_services? to always return true for teachers
  def can_use_services?
    true
  end
end
