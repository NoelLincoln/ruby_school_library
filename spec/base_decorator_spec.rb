require_relative '../base_decorator'

RSpec.describe BaseDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'John Doe') }
  let(:decorator) { BaseDecorator.new(nameable) }

  describe '#initialize' do
    it 'creates a new decorator with a nameable object' do
      expect(decorator.nameable).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'calls the correct_name method on the nameable object' do
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
