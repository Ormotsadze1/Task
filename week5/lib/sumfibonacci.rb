# frozen_string_literal: true

# Sum all even numbers in a Fibonacci sequence
class FibonacciService
  class AttributeError < StandardError; end
  ALPHABETICAL = '^0-9'
  BEFORE_LAST = -2

  def initialize(quantity = 0)
    @quantity = quantity.to_s
    @fibonacci = [1, 1]
  end

  def call
    validate_parameters
    find_fibonacci
    detect_even_fibonacci
    sum_of_fibonacci
  rescue AttributeError => e
    e.message
  end

  private

  def validate_parameters
    return unless @quantity.count(ALPHABETICAL).positive? || @quantity.empty?

    raise AttributeError, 'Input must include only a number'
  end

  def find_fibonacci
    @fibonacci << @fibonacci.last + @fibonacci[BEFORE_LAST] while @fibonacci.size < @quantity.to_i
    @fibonacci
  end

  def detect_even_fibonacci
    @fibonacci.select(&:even?)
  end

  def sum_of_fibonacci
    detect_even_fibonacci.sum
  end
end

puts FibonacciService.new(5).call
