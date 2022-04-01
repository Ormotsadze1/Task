#Rectangular,isosceles and equilateral triangle.

NUMBER = 2

class Rectangular
  def initialize
    puts "First side?"
    @side1 = gets.chomp.to_i
    puts "Second side?"
    @side2 = gets.chomp.to_i
    puts "Third side?"
    @side3 = gets.chomp.to_i
  end

  def triangle
    arr = [@side1, @side2, @side3].sort
    if @side1 && @side2 == @side3
      puts "Equilateral triangle"
    elsif (arr[0] ** NUMBER + arr[1] ** NUMBER == arr[2] ** NUMBER) && arr[0] == arr[1]
      puts "Rectangular isosceles triangle"
    elsif arr[0] ** NUMBER + arr[1] ** NUMBER == arr[2] ** NUMBER
      puts "Rectangular triangle"
    elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
      puts "Isosceles triangle"
    else
      puts "Unknown triangle"
    end
  end
end

Rectangular.new.triangle
