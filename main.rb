require_relative 'app'

class LibraryApp
  def initialize
    @app = App.new
  end

  def start
    display_welcome_message

    loop do
      display_menu
      option = get_user_input

      case option
      when 1 then @app.all_books
      when 2 then @app.all_people
      when 3 then create_person
      when 4 then @app.create_book
      when 5 then @app.create_rental
      when 6 then @app.list_rentals
      when 7 then break
      else
        puts 'Invalid option. Try again'
      end
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

  def get_user_input
    gets.chomp.to_i
  end

  def create_person
    puts 'Creating a person...'
    @app.create_person
  end
end

LibraryApp.new.start
