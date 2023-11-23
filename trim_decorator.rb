# trimmer_decorator.rb
require_relative 'nameable'

# Trimmer decorator, extending the behaviour of concrete component person
class TrimmerDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    trimmed_name = @nameable.correct_name[0, 10]
    trimmed_name || ''
  end
end
