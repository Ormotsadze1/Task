# frozen_string_literal: true

# The area of a triangle.
class CalculateTriangleAreaService
  DIVIDER = 2
  EDGE = 0

  def initialize
    puts 'What is the base of a triangle?'
    @base = gets.chomp
    puts 'What is the height of a triangle?'
    @height = gets.chomp
  end

  def call
    validate_base_parameter
    validate_height_parameter
    calculate_area
  end

  private

  def validate_base_parameter
    return unless @base.to_i <= EDGE || @base.count('a-zA-Z').positive?

    warn 'wrong input for base'
    exit 1
  end

  def validate_height_parameter
    return unless @height.to_i <= EDGE || @height.count('a-zA-Z').positive?

    warn 'wrong input for height'
    exit 1
  end

  def calculate_area
    (@base.to_i * @height.to_i) / DIVIDER
  end
end

puts CalculateTriangleAreaService.new.call
