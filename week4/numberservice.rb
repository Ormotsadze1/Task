# frozen_string_literal: true

# Count the number of characters in each array element
class NumbersService
  def initialize
    @hash = {}
    @counter = 0
    @words = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript']
    @array_size = @words.size - 1
  end

  def call
    hash_by_words
  end

  private

  def hash_by_words
    while @counter <= @array_size
      @hash = @hash.merge({ @words[@counter] => @words[@counter].length })
      @counter += 1
    end
    @hash
  end
end

puts NumbersService.new.call

