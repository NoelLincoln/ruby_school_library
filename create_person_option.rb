# create person option
require_relative 'menu_option'

class CreatePersonOption < MenuOption
  def execute
    puts 'Creating a person...'
    @app.create_person
  end

  def name
    'Create a person'
  end
end
