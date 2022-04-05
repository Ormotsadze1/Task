# frozen_string_literal: true

# Rectangular,isosceles and equilateral triangle.
class RectangularTRiangle
  SQUARER = 2

  def initialize
    puts 'First side?'
    @side1 = gets.chomp.to_i
    puts 'Second side?'
    @side2 = gets.chomp.to_i
    puts 'Third side?'
    @side3 = gets.chomp.to_i
    @sides = [@side1, @side2, @side3].sort
  end

  def call
    validate_parameteres
    equilateral
    isosceles
    reqtangular
  end

  def validate_parameteres
    return unless @sides.include? 0

    warn 'wrong parameters for triangle'
    exit 1
  end

  def equilateral
    return unless @side1 && @side2 == @side3

    puts 'Equilateral triangle'
    exit 1
  end

  def isosceles
    return unless @side1 == @side2 || @side1 == @side3 || @side2 == @side3

    puts 'Isosceles triangle'
    exit 1
  end

  def reqtangular
    return unless @sides[0]**SQUARER + @sides[1]**SQUARER == @sides[2]**SQUARER

    puts 'Rectangular triangle'
    exit 1
  end

  def rectangular_isosceles
    return unless equilateral && isosceles

    puts 'Rectangular isosceles triangle'
    exit 1
  end
end

RectangularTRiangle.new.call
