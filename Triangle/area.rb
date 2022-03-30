#The area of a triangle.

class Area
  NUMBER = 2
  def initialize
    puts "What is the base of a triangle?"
    @base = gets.chomp.to_i
    puts "What is the height of a triangle?"
    @height = gets.chomp.to_i
  end

  def triangle
    (@base * @height) / NUMBER
  end
end

puts Area.new.triangle