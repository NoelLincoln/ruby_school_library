# frozen_string_literal: true

require_relative 'base_decorator'

# trim decorator implements base decorator correct name method
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.strip
  end
end
