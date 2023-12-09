require_relative 'menu_option'

# list people
class ListPeopleOption < MenuOption
  def execute
    @app.all_people
  end

  def name
    'List all people'
  end
end
