require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts ' '

  loop do
    display_menu
    option = get_user_input

    case option
    when 1
      app.all_books
    when 2
      app.all_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    when 7
      break
    else
      puts 'Invalid option. Try again'
    end
  end
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

main