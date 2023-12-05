require_relative 'menu_option'

# create menu exit option
class ExitOption < MenuOption
  def execute
    :exit
  end

  def name
    'Exit'
  end
end
