#Find the ordinal number of the date

require 'date'

class Ordinal_number
  def initialize
    puts "day?"
    @day = gets.chomp
    puts "month?"
    @month = gets.chomp
    puts "year?"
    @year = gets.chomp
  end

  def date
    Date.new(@year.to_i, @month.to_i, @day.to_i).yday
  end
end

puts Ordinal_number.new.date