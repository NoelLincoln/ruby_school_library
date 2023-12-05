require_relative 'menu_option'

# create book option
class CreateBookOption < MenuOption
  def execute
    @app.create_book
  end

  def name
    'Create a book'
  end
end
