# frozen_string_literal: true

# Calculate the factorial of a number
class CalculateFactorial
  ALPHABETICS = '^0-9'

  def initialize
    puts 'Input number'
    @number = gets.chomp
    @limited_numbers = []
  end

  def call
    validate_parameters
    collect_numbers
    calculate_factorial
  end

  private

  def validate_parameters
    return unless @number.count(ALPHABETICS).positive? || @number.empty?

    warn 'Input must include only numbers'
    exit 1
  end

  def collect_numbers
    @number = @number.to_i
    if @number.zero?
      @limited_numbers = 1
    else
      (1..@number).select { |num| num }
    end
  end

  def calculate_factorial
    collect_numbers.inject(:*)
  end
end

p CalculateFactorial.new.call

