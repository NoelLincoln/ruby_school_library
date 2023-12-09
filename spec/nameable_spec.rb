require_relative '../nameable'

RSpec.describe Nameable do
  let(:nameable) { Nameable.new }

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError, 'Please implement the correct_name method')
    end
  end
end
