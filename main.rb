require_relative 'app'

class LibraryApp
  def initialize
    @app = App.new
  end

  def start
    display_welcome_message

    loop do
      display_menu
      option = user_input
      handle_option(option)
      break if option == 7
    end
  end

  private

  def display_welcome_message
    puts 'Welcome to School Library App!'
    puts ' '
  end

  def display_menu
    puts 'Please select an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id '
    puts '7. Exit'
  end

  def user_input
    gets.chomp.to_i
  end

  def handle_option(option)
    case option
    when 1 then list_all_books
    when 2 then list_all_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7 then exit_program
    else
    handle_invalid_option
    end
  end

  def list_all_books
    @app.all_books
  end

  def list_all_people
    @app.all_people
  end

  def create_person
    puts 'Creating a person...'
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals
    @app.list_rentals
  end

  def handle_invalid_option
  puts 'Invalid option. Try again'
end

end

def exit_program
  puts 'Thank you for using this app!'
  end

LibraryApp.new.start
