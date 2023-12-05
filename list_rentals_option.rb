require_relative ''

class ListRentalsOption < MenuOption
  def execute
    @app.list_rentals
  end

  def name
    'List all rentals for a given person id'
  end
end