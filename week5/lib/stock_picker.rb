# frozen_string_literal: true

# Stock Picker
class StockPickerService
  class AttributeError < StandardError; end
  ALPHABETICAL = '^0-9'
  SUBTRACTOR = 1
  MIDDLE = 1
  EDGE = 2

  def initialize(prices = [])
    @prices = prices
  end

  def call
    not_array?
    empty?
    not_numbers?
    validate_parameters
    one_variant?
    unprofitable?
    detect_all_variant
    check_profit
    detect_the_best
    output_result
  rescue AttributeError => e
    e.message
  end

  private

  def not_array?
    return if @prices.is_a?(Array)

    raise AttributeError, 'Input must be only a array'
  end

  def empty?
    @prices.flatten.empty?
  end

  def not_numbers?
    @prices.map(&:to_s).join.count(ALPHABETICAL).positive?
  end

  def validate_parameters
    return unless not_numbers? || empty?

    raise AttributeError, 'Input must include only numbers(minimum 2)'
  end

  def one_variant?
    @input_prices = @prices.map(&:to_i).reverse
    @prices.map!(&:to_i)
    @prices.uniq.size < EDGE
  end

  def unprofitable?
    return unless @prices.sort == @prices.reverse || one_variant?

    raise AttributeError, 'No profitable offer'
  end

  def detect_all_variant
    @prices = @prices.combination(2).to_a.select { |buy, sell| buy < sell }
  end

  def check_profit
    @profit = @prices.map { |money| money.inject(:-).abs }
    @prices = @prices.zip(@profit)
  end

  def detect_the_best
    @prices = @prices.max_by(&:last).flatten!
  end

  def output_result
    buy = @input_prices.find_index(@prices.first)
    buy = (buy - (@input_prices.size - SUBTRACTOR)).abs
    sell = @input_prices.find_index(@prices[MIDDLE])
    sell = (sell - (@input_prices.size - SUBTRACTOR)).abs
    [buy, sell]
  end
end

p StockPickerService.new(8).call
