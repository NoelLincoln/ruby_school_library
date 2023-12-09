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

  def fizzbuzz(n)
    if n % 3 == 0 && n % 5 == 0
      'fizzbuzz'
    elsif n % 3 == 0
      'fizz'
    elsif n % 5 == 0
      'buzz'
    else
      n.to_s
    end
  end

  private

  def valid_input?(num)
    num.is_a?(Integer) && num >= 0
  end
end
