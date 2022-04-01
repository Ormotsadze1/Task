#Fill the array with Fibonacci numbers up to 100
Max = 100
class Numbers
  def fibonacci
    arr = [1,1]
    while arr.size <= Max
      arr << arr[-1] + arr[-2]
    end
    arr
  end
end

puts Numbers.new.fibonacci
