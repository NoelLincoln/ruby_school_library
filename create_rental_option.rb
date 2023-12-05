# frozen_string_literal: true

require_relative 'menu_option'

# create book rental option
class CreateRentalOption < MenuOption
  def execute
    @app.create_rental
  end

  def name
    'Create a rental'
  end
end
