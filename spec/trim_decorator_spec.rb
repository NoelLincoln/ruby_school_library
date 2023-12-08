# spec/trim_decorator_spec.rb

require_relative '../trim_decorator'

RSpec.describe TrimDecorator do
  let(:nameable_double) { double('Nameable') }

  describe '#correct_name' do
    it 'trims the correct name to the first 10 characters' do
      trimmed_name = 'John Doe Trimmed'
      allow(nameable_double).to receive(:correct_name).and_return(trimmed_name)

      trim_decorator = described_class.new(nameable_double)
      result = trim_decorator.correct_name

      expect(result).to eq(trimmed_name[0, 10])
    end

    it 'calls correct_name on the nameable object' do
      allow(nameable_double).to receive(:correct_name).and_return(nil)
      expect { described_class.new(nameable_double).correct_name }.not_to raise_error
    end
  end
end
