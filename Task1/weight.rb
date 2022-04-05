# frozen_string_literal: true

# display the ideal weight using the formula <height> - 110
class IdealWeight
  SUBSTRACTOR = 110

  def initialize
    puts 'Enter your name: '
    @name = gets.chomp.capitalize
    puts 'Enter your height: '
    @height = gets.chomp
  end

  def call
    validate_parameters
    detect_ideal_weight
  end

  private

  def validate_parameters
    return unless @height.to_i.negative? || @height.count('a-zA-Z').positive?

    warn 'incorrect input for height!'
    exit 1
  end

  def detect_ideal_weight
    difference = @height.to_i - SUBSTRACTOR
    if difference.negative?
      "#{@name}, your weight is already optimal"
    else
      "#{@name}, your ideal weight is #{difference}"
    end
  end
end

puts IdealWeight.new.call
