require_relative ''

class CreateBookOption < MenuOption
  def execute
    @app.create_book
  end

  def name
    'Create a book'
  end
end