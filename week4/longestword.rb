# frozen_string_literal: true

# find the longestword in an array
class WordsService
  def initialize
    @words = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript']
  end

  def call
    sort_words_array
    find_longest_word
  end

  private

  def sort_words_array
    @words = @words.sort_by(&:length)
  end

  def find_longest_word
    @words[-1]
  end
end

puts WordsService.new.call

