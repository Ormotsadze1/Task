# frozen_string_literal: true

# "Finding Duplicates
class FindingDuplicatesService
  ALPHABETICS = '^0-9'
  EDGE = 1

  def initialize
    puts 'Input numbers'
    @import = gets.chomp
    @all_nums = []
  end

  def call
    validate_parameters
    fill_array
    find_duplicates
    display_duplicates
    no_duplicates?
  end

  private

  def validate_parameters
    return unless @import.count(ALPHABETICS).positive? || @import.length.zero?

    warn 'Incorrect input for numbers!'
    exit 1
  end

  def fill_array
    @all_nums = @import.split('')
  end

  def find_duplicates
    @find_duplicates ||= @all_nums.select { |num| @all_nums.count(num) > EDGE }.uniq
  end

  def display_duplicates
    puts @find_duplicates
  end

  def no_duplicates?
    'Duplicates not found' if find_duplicates.empty?
  end
end

puts FindingDuplicatesService.new.call

