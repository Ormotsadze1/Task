# frozen_string_literal: true

require 'csv'

class CSVWrite
  def initialize
    @path = '../data.csv'
  end

  def write(word)
    CSV.open(@path, 'a') do |csv|
      csv << [word]
    end
  end

  def read
    CSV.read(@path)
  end
end