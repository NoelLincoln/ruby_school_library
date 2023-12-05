require_relative 'menu_option'

class ExitOption < MenuOption
  def execute
    :exit
  end

  def name
    'Exit'
  end
end