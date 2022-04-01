#Fill in the array with numbers from 10 to 100 in increments of 5

MINIMUM = 10
MAXIMUM = 100
FIVE = 5
ZERO = 0

class Numbers
  def five_increment
    arr = [ *MINIMUM..MAXIMUM].select { |number| number % FIVE == ZERO }
    arr
  end
end

puts Numbers.new.five_increment
