# frozen_string_literal: true

require_relative '../person'
require_relative '../book'
require 'date'

RSpec.describe Person do
  let(:person) { Person.new(25, 'John Doe') }

  describe '#initialize' do
    it 'creates a person with the given attributes' do
      expect(person.age).to eq(25)
      expect(person.name).to eq('John Doe')
      expect(person.parent_permission).to be true
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    it 'returns true if person is of age' do
      expect(person.can_use_services?).to be true
    end

    it 'returns true if person has parent permission' do
      person.parent_permission = false
      expect(person.can_use_services?).to be true
    end

    it 'returns false if person is not of age and has no parent permission' do
      person.age = 15
      person.parent_permission = false
      expect(person.can_use_services?).to be false
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#rent_book' do
    it 'creates a rental and adds it to rentals' do
      person = Person.new(25, 'John Doe')
      book = Book.new('French', 'Bryant')
      rental_date = Date.new(2023, 1, 1)

      expect { book.add_rental(person, rental_date) }.to change { person.rentals.size }.from(0).to(1)
    end
  end

  describe '#return_book' do
    it 'removes a rental from rentals' do
      instance_double('Book', add_rental: nil)
      rental = instance_double('Rental')
      person.rentals << rental

      expect { person.return_book(rental) }.to change { person.rentals.size }.from(1).to(0)
    end
  end
end
