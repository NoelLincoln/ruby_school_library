

require_relative 'menu_option'

# list books
class ListBooksOption < MenuOption
  def execute
    @app.all_books
  end

  def name
    'List all books'
  end
end
