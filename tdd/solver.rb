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

  private

  def valid_input?(num)
    num.is_a?(Integer) && num >= 0
  end
end
