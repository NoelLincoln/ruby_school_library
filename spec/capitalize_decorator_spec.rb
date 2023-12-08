# frozen_string_literal: true

require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'john') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct_name from the wrapped nameable' do
      expect(decorator.correct_name).to eq('John')
    end
  end
end
