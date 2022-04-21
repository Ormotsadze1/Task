# frozen_string_literal: true

# Program returns the missing number between 1 and 10.
class NumbersService
  class AttributeError < StandardError; end
  FULL_NUMBERS = %w[1 2 3 4 5 6 7 8 9 10].map(&:to_i).freeze
  BEGINNER = 1
  FINISHER = 10
  EDGE = 9

  def initialize(numbers = [])
    @numbers = numbers.map(&:to_i)
  end

  def call
    validate_parameters
    detect_missing_number
  rescue AttributeError => e
    e.message
  end

  private

  def validate_parameters
    return unless !nine_positive? || in_interval? || @numbers.empty?

    raise AttributeError, 'Input must include only 9 digits from (1-10)'
  end

  def nine_positive?
    @numbers.all?(&:positive?) && @numbers.size == EDGE
  end

  def in_interval?
    @numbers.min < BEGINNER && @numbers.max > FINISHER
  end

  def detect_missing_number
    (FULL_NUMBERS - @numbers).last
  end
end

puts NumbersService.new([1, 2, 3, 4, 5, 6, 7, 8, 9]).call

