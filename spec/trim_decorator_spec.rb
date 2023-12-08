# spec/trimmer_decorator_spec.rb
require_relative '../trim_decorator'

describe TrimmerDecorator do
  let(:nameable_double) { instance_double('Nameable', correct_name: '   John Doe   ') }

  describe '#correct_name' do
    it 'strips leading and trailing spaces from the correct_name of the nameable object' do
      trim_decorator = described_class.new(nameable_double)
      expect(trim_decorator.correct_name).to eq('John Doe')
    end

    it 'does not modify the original correct_name method of the nameable object' do
      trim_decorator = described_class.new(nameable_double)
      expect { trim_decorator.correct_name }.not_to change { nameable_double.correct_name }
    end
  end
end
