# frozen_string_literal: true

require_relative 'menu_option'

# List Book Rentals option
class ListRentalsOption < MenuOption
  def execute
    @app.list_rentals
  end

  def name
    'List all rentals for a given person id'
  end
end
