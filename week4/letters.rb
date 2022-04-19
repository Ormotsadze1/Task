# frozen_string_literal: true

# Map the letters of a string
class MapLettersService
  NUMERALS = '^a-zA-Z'

  def initialize
    puts 'Enter the word'
    @word = gets.chomp
    @letters = []
    @count = 0
    @index = []
  end

  def call
    validate_parameters
    word_into_letters
    detect_indexes
    letter_match_index
  end

  private

  def validate_parameters
    return unless @word.count(NUMERALS).positive? || @word.length.zero?

    warn 'The word must include only letters'
    exit 1
  end

  def word_into_letters
    @letters = @word.split('').uniq
  end

  def detect_indexes
    @word = @word.split('')
    while @count < @letters.size
      letter = @letters[@count]
      @index << @word.each_index.select { |index| @word[index] == letter }
      @count += 1
    end
    @index
  end

  def letter_match_index
    @count = 0
    output_hash = {}
    while @count < @letters.size
      output_hash = output_hash.merge({ @letters[@count] => @index[@count] })
      @count += 1
    end
    output_hash
  end
end

puts MapLettersService.new.call

