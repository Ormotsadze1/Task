# frozen_string_literal: true

require 'prime'

# "How Many Prime Numbers Are in a Given Array
class CauntPrimeService
  ALPHABETICS = /\D/.freeze

  def initialize
    @numbers = []
    @primes = []
  end

  def call
    take_numbers
    validate_parameters
    find_primes
    count_primes
  end

  private

  def take_numbers
    input = ''
    while input
      puts 'Input numbers ( enter "stop" to finish)'
      input = gets.chomp
      break if input == 'stop'

      @numbers << input
    end
    @numbers
  end

  def validate_parameters
    return if @numbers.join('').scan(ALPHABETICS).empty?

    warn 'Input must include only numbers'
    exit 1
  end

  def find_primes
    @primes = @numbers.map(&:to_i).select { |num| Prime.prime?(num) }
  end

  def count_primes
    @primes.size
  end
end

puts CauntPrimeService.new.call

