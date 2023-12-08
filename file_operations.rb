# frozen_string_literal: true

require 'json'

# file operations class
class FileOperations
  def initialize(app)
    @app = app
  end

  def save_data_to_files
    save_to_file('books.json', @app.books)
    save_to_file('people.json', @app.people)
    save_to_file('rentals.json', @app.rentals)
  end

  def load_data_from_files
    load_books
    load_people
    load_rentals
  end

  private

  def load_books
    load_from_file('books.json') do |data|
      @app.books = data.map { |book_data| Book.new(book_data['title'], book_data['author']) }
    end
  end

  def load_people
    load_from_file('people.json') do |data|
      @app.people = data.map(&method(:create_person_from_data)).compact
    end
  end

  def load_rentals
    load_from_file('rentals.json') do |data|
      @app.rentals = data.map(&method(:create_rental_from_data))
    end
  end

  def save_to_file(file_name, data)
    File.open(file_name, 'w') do |file|
      file.puts JSON.generate(data.map(&:to_hash))
    end
  end

  def load_from_file(file_name, &block)
    return unless File.exist?(file_name)

    json_data = File.read(file_name)
    data = JSON.parse(json_data)
    block.call(data) if block_given?
  end

  def create_person_from_data(person_data)
    if person_data['type'] == 'Student'
      Student.new(person_data['age'], person_data['parent_permission'], person_data['name'])
    elsif person_data['type'] == 'Teacher'
      Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
    end
  end

  def create_rental_from_data(rental_data)
    book = find_book_by_title(rental_data['book_title'])
    person = find_person_by_name(rental_data['person_name'])
    date = Date.parse(rental_data['date'])
    Rental.new(date, book, person)
  end

  def find_book_by_title(title)
    @app.books.find { |book| book.title == title }
  end

  def find_person_by_name(name)
    @app.people.find { |person| person.name == name }
  end

  def find_person_by_id(person_id)
    @app.people.find { |person| person.id == person_id }
  end
end
