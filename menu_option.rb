# menu options
class MenuOption
  def initialize(app)
    @app = app
  end

  def execute
    raise NotImplementedError, 'Subclasses must implement the execute method'
  end

  def name
    raise NotImplementedError, 'Subclasses must implement the name method'
  end
end
