# frozen_string_literal: true

require_relative 'ListBooksOption'
require_relative 'ListPeopleOption'
require_relative 'create_book_option'
require_relative 'create_person_option'
require_relative 'create_rental_option'
require_relative 'list_rentals_option'
require_relative 'exit_option'

# display menu
class Menu
  def initialize(app)
    @app = app
    @options = [
      ListBooksOption,
      ListPeopleOption,
      CreatePersonOption,
      CreateBookOption,
      CreateRentalOption,
      ListRentalsOption,
      ExitOption
    ]
  end

  def display
    puts 'Please select an option by entering a number:'
    @options.each_with_index { |option, index| puts "#{index + 1}. #{option.new(@app).name}" }
  end

  def handle_option(option)
    @options[option - 1].new(@app).execute
  end
end
