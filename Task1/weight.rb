#ideal weight
MARGIN = 110
class Ideal
  def initialize
    puts "Enter your name: "
    @name = gets.chomp.capitalize
    puts "Enter your height: "
    @height = gets.chomp.to_i
  end

  def weight
    difference = @height - MARGIN
    if difference.negative?
      "Your weight is already optimal"
    else
      "#{@name} your ideal weight is #{difference}"
    end
  end
end

puts Ideal.new.weight
