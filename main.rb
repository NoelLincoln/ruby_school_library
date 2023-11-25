require_relative 'app'

class LibraryApp
  def initialize
    @app = App.new
  end

  def start
    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/MethodLength
    display_welcome_message

    loop do
      display_menu
      option = user_input

      case option
      when 1 then list_all_books
      when 2 then list_all_people
      when 3 then create_person
      when 4 then create_book
      when 5 then create_rental
      when 6 then list_rentals
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

  def user_input
    gets.chomp.to_i
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
end

LibraryApp.new.start
