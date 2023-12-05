require_relative 'app'

# app entry point
class LibraryApp
  def initialize
    @app = App.new
    @menu = Menu.new(@app)
  end

  def start
    display_welcome_message

    loop do
      @menu.display
      option = user_input
      break if @menu.handle_option(option) == :exit
    end

    exit_program
  end

  private

  def display_welcome_message
    puts 'Welcome to School Library App!'
    puts ' '
  end

  def user_input
    gets.chomp.to_i
  end

  def exit_program
    puts 'Thank you for using this app! Goodbye!'
  end
end