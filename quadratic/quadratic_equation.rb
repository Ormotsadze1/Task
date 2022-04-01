#A quadratic equation

NUMBER2 = 2
NUMBER4 = 4
ZERO = 0

class Quadratic
  def initialize
    puts "input first coefficient"
    @coef1 = gets.chomp.to_i
    puts "input second coefficient"
    @coef2 = gets.chomp.to_i
    puts "input third coefficient"
    @coef3 = gets.chomp.to_i
  end

  def equation
    discriminant = @coef2 ** NUMBER2 - NUMBER4 * (@coef1 * @coef3)
    if discriminant > ZERO
      root1 = (-@coef2 + Math.sqrt(discriminant)) / NUMBER2 * @coef1
      root2 = (-@coef2 - Math.sqrt(discriminant)) / NUMBER2 * @coef1
      "Discriminant is #{discriminant} with roots #{root1.to_s} and #{root2.to_s}"
    elsif discriminant == ZERO
      root1 = (-@coef2 + Math.sqrt(discriminant)) / NUMBER2 * @coef1
      "Discriminant is #{discriminant} and root is #{root1}"
    else
      "Discriminant is #{discriminant}, No Roots "
    end
  end
end

puts Quadratic.new.equation
