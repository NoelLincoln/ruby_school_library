require_relative '../tdd/solver'

describe Solver do
  describe '#factorial' do
    it 'returns 1 for 0' do
      solver = Solver.new
      expect(solver.factorial(0)).to eq(1)
    end

    it 'raises FactorialError for negative integers' do
      solver = Solver.new
      expect { solver.factorial(-3) }.to raise_error(ArgumentError, 'Input must be a non-negative integer')
      expect { solver.factorial(-10) }.to raise_error(ArgumentError, 'Input must be a non-negative integer')
    end
  end

  describe '#reverse' do
    it 'returns the reversed word' do
      solver = Solver.new
      expect(solver.reverse('hello')).to eq('olleh')
    end
  end

  describe '#fizzbuzz' do
    it 'returns "fizz" for multiples of 3' do
      solver = Solver.new
      expect(solver.fizzbuzz(3)).to eq('fizz')
      expect(solver.fizzbuzz(6)).to eq('fizz')
      expect(solver.fizzbuzz(9)).to eq('fizz')
    end

    it 'returns "buzz" for multiples of 5' do
      solver = Solver.new
      expect(solver.fizzbuzz(5)).to eq('buzz')
      expect(solver.fizzbuzz(10)).to eq('buzz')
      expect(solver.fizzbuzz(20)).to eq('buzz')
    end

    it 'returns "fizzbuzz" for multiples of both 3 and 5' do
      solver = Solver.new
      expect(solver.fizzbuzz(15)).to eq('fizzbuzz')
      expect(solver.fizzbuzz(30)).to eq('fizzbuzz')
      expect(solver.fizzbuzz(45)).to eq('fizzbuzz')
    end

    it 'returns the input as a string for other cases' do
      solver = Solver.new
      expect(solver.fizzbuzz(7)).to eq('7')
      expect(solver.fizzbuzz(14)).to eq('14')
      expect(solver.fizzbuzz(22)).to eq('22')
    end
  end
end
