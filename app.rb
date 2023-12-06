require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require 'date'
require 'json'

# core functionality class
class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # method to show list of all books
  def all_books(show_index: false)
    if @books.empty?
      puts 'There are no books in the library'
    else
      @books.each_with_index do |book, index|
        puts "#{show_index ? index : ' '} Title: \"#{book.title}\", Author:  #{book.author}"
      end
    end
    puts
  end

  # create person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid Option'
    end
  end

  # method to show list of all person
  def all_people(show_index: false)
    if @people.empty?
      puts 'There are no people in the library'
    else
      @people.each_with_index do |person, index|
        puts "#{show_index ? index : ' '} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  # create new book
  def create_book
    print 'Enter Title: '
    title = gets.chomp
    print 'Enter Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book Created Successfully'
    puts ' '
  end

  # create student
  def create_student
    print 'Enter Name: '
    name = gets.chomp
    print 'Enter Age: '
    age = gets.chomp
    print 'Has Parents permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(age, parent_permission, name)
    @people << student
    puts 'Person Created Successfully'
    puts ' '
  end

  def create_teacher
    print 'Enter Name: '
    name = gets.chomp
    print 'Enter Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Person Created Successfully'
    puts ' '
  end

  # method to create a new rental
  def create_rental
    puts 'Select a book from the following list by number'
    all_books(show_index: true)
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    all_people(show_index: true)
    person_index = gets.chomp.to_i
    print 'Date: '
    date = Date.parse(gets.chomp)
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    puts 'Rental Created Successfully'
    puts ' '
  end

  # List all rentals for a given person id
  # List all rentals for a given person id
  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    person = find_person_by_id(id)

    if person
      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        puts ' '
      end
    else
      puts 'Person not found.'
    end
  end

  private

  def find_person_by_id(person_id)
    @people.find { |person| person.id == person_id }
  end

  def save_data_to_files
    save_books_to_file
    save_people_to_file
    save_rentals_to_file
  end

  def load_data_from_files
    load_books_from_file
    load_people_from_file
    load_rentals_from_file
  end

  private
  def save_books_to_file
    File.open('books.json', 'w') do |file|
      file.puts JSON.generate(@books.map(&:to_hash))
    end
  end

  def load_books_from_file
    if File.exist?('books.json')
      json_data = File.read('books.json')
      books_data = JSON.parse(json_data)
      @books = books_data.map { |book_data| Book.new(book_data['title'], book_data['author']) }
    end
  end

  def save_people_to_file
    File.open('people.json', 'w') do |file|
      file.puts JSON.generate(@people.map(&:to_hash))
    end
  end

  def load_people_from_file
    if File.exist?('people.json')
      json_data = File.read('people.json')
      people_data = JSON.parse(json_data)
      @people = people_data.map do |person_data|
        if person_data['type'] == 'Student'
          Student.new(person_data['age'], person_data['parent_permission'], person_data['name'])
        elsif person_data['type'] == 'Teacher'
          Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
        else
          nil
        end
      end.compact
    end
  end

  def save_rentals_to_file
    File.open('rentals.json', 'w') do |file|
      file.puts JSON.generate(@rentals.map(&:to_hash))
    end
  end

  def load_rentals_from_file
    if File.exist?('rentals.json')
      json_data = File.read('rentals.json')
      rentals_data = JSON.parse(json_data)
      @rentals = rentals_data.map do |rental_data|
        book = find_book_by_title(rental_data['book_title'])
        person = find_person_by_name(rental_data['person_name'])
        date = Date.parse(rental_data['date'])
        Rental.new(date, book, person)
      end
    end
  end
end
