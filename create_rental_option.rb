require_relative ''

class CreateRentalOption < MenuOption
  def execute
    @app.create_rental
  end

  def name
    'Create a rental'
  end
end