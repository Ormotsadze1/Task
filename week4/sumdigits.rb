# frozen_string_literal: true

# Display sum of digits
class SumDigitsService
  ALPHABETICS = '^0-9'

  def initialize(starter, edge)
    @starter = starter
    @edge = edge
  end

  def call
    validate_parameters
    sum_digits
  end

  private

  def validate_parameters
    return unless !@starter.is_a?(Integer) || !@edge.is_a?(Integer)

    warn 'Wrong parameters'
    exit 1
  end

  def sum_digits
    sum = []
    while @starter <= @edge
      sum << @starter
      @starter += 1
    end
    sum.inject(0, :+)
  end
end

puts SumDigitsService.new(1, 10).call

