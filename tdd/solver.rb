# class solver
class Solver
  def reverse(word)
    word.reverse
  end

  def factorial(num)
    raise ArgumentError, 'Input must be a non-negative integer' unless valid_input?(num)
    return 1 if num.zero?

    (1..num).reduce(:*)
  end

  def fizzbuzz(num)
    if (num % 3).zero? && (num % 5).zero?
      'fizzbuzz'
    elsif (num % 3).zero?
      'fizz'
    elsif (num % 5).zero?
      'buzz'
    else
      num.to_s
    end
  end

  private

  def valid_input?(num)
    num.is_a?(Integer) && num >= 0
  end
end
