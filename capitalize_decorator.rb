# capitalize_decorator.rb
require_relative 'nameable'

# Capitalize decorator
class CapitalizeDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
