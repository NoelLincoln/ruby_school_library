require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'file_operations'
require 'date'
require 'json'

# Core functionality class
class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @file_operations = FileOperations.new(@app)
  end

  # Methods to interact with books, people, and rentals
  def all_books(show_index: false)
    if @books.empty?
      puts 'There are no books in the library'
    else
      @books.each_with_index do |book, index|
        puts "#{show_index ? index : ' '} Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end

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

  # Public methods for saving and loading data
  def save_data_to_files
    @file_operations.save_data_to_files
  end

  def load_data_from_files
    @file_operations.load_data_from_files
  end

  def find_person_by_id(person_id)
    @people.find { |person| person.id == person_id }
  end
end
