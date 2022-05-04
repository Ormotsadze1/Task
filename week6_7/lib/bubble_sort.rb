# frozen_string_literal: true

# Bubble sort method
class BubbleSortService
  class AttributeError < StandardError; end
  ALPHABETICS = '^-0-9'
  NEXT = 1
  SUBSTRACTOR = 1

  def initialize(numbers = nil)
    @numbers = numbers
    @switched = false
  end

  def call
    no_input?
    not_numbers?
    validate_parameters
    map_to_integer
    max_to_end
    bubble_sort
  rescue AttributeError => e
    e.message
  end

  private

  def no_input?
    return unless !@numbers.is_a?(Array) || @numbers.nil? || @numbers.empty?

    raise AttributeError, 'Numbers not found'
  end

  def not_numbers?
    @numbers.map(&:to_s).join.count(ALPHABETICS).positive?
  end

  def validate_parameters
    return unless not_numbers?

    raise AttributeError, 'Wrong parameters!'
  end

  def map_to_integer
    @numbers.map!(&:to_i)
  end

  def max_to_end
    count = 0
    while count < @numbers.size - SUBSTRACTOR
      if @numbers[count] > @numbers[count + NEXT]
        @numbers[count], @numbers[count + NEXT] = @numbers[count + NEXT], @numbers[count]
        count += NEXT
        @switched = true
      else
        count += NEXT
      end
    end
  end

  def bubble_sort
    loop do
      @switched = false
      max_to_end
      break if @switched == false
    end
    @numbers
  end
end

p BubbleSortService.new(['4', -10, 1, 2, -1, 5]).call

