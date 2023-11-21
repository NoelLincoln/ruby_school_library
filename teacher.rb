# frozen_string_literal: true

require_relative 'person'

# Represents a teacher with additional specialization.
class Teacher < Person
  attr_reader :specialization

  def initialize(id, age = 18, name = 'Unknown', parent_permission: true, specialization: 'Ruby on Rails')
    # Call the parent's constructor using super
    super(id, age, name, parent_permission: true)
    @specialization = specialization
  end

  # Override can_use_services? to always return true for teachers
  def can_use_services?
    true
  end
end
