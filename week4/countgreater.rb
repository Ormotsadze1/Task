# frozen_string_literal: true

# Count how many items are greater than 5
class CountGreaterService
  EDGE = 5
  ALPHABETICS = '^0-9'

  def initialize(numbers)
    @numbers = numbers
    @greaters = []
  end

  def call
    validate_parameters
    find_greater
    count_greaters
  end

  def validate_parameters
    return unless @numbers.join('').count(ALPHABETICS).positive?

    warn 'input only numbers'
    exit 1
  end

  def find_greater
    @greaters = @numbers.select { |num| num > EDGE }
  end

  def count_greaters
    @greaters.size
  end
end

puts CountGreaterService.new([1, 2, 3, 5, 6, 7, 8, 9, 10, 11]).call

