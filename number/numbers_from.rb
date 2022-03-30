#Fill in the array with numbers from 10 to 100 in increments of 5

class Numbers
  MINIMUM = 10
  MAXIMUM = 100
  FIVE = 5
  ZERO = 0
  def five_increment
    arr = [ *MINIMUM..MAXIMUM].select { |number| number % FIVE == ZERO }
    arr
  end
end

puts Numbers.new.five_increment