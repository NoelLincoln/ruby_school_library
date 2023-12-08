# frozen_string_literal: true

require_relative 'menu_option'

# create person option
class CreatePersonOption < MenuOption
  def execute
    puts 'Creating a person...'
    @app.create_person
  end

  def name
    'Create a person'
  end
end
