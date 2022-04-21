# frozen_string_literal: true

require 'stock_picker'

describe StockPickerService do
  it 'returns a pair of days' do
    expect(StockPickerService.new([17, 3, 6, 9, 15, 8, 6, 1, 10]).call).to eq [1, 4]
  end

  it 'raises error message' do
    expect(StockPickerService.new('').call).to eq 'Input must be only a array'
  end

  it 'returns a pair of days' do
    expect(StockPickerService.new([13, '3', 7]).call).to eq [1, 2]
  end

  it 'raises error message' do
    expect(StockPickerService.new.call).to eq 'Input must include only numbers(minimum 2)'
  end

  it 'raises error message' do
    expect(StockPickerService.new([]).call).to eq 'Input must include only numbers(minimum 2)'
  end

  it 'raises error message' do
    expect(StockPickerService.new(%w[hello friend]).call).to eq 'Input must include only numbers(minimum 2)'
  end

  it 'raises error message' do
    expect(StockPickerService.new(['perfect', 1, 5]).call).to eq 'Input must include only numbers(minimum 2)'
  end

  it 'raises error message' do
    expect(StockPickerService.new([1]).call).to eq 'No profitable offer'
  end

  it 'raises error message' do
    expect(StockPickerService.new([9, 9, 9, 9, 9, 9]).call).to eq 'No profitable offer'
  end

  it 'raises error message' do
    expect(StockPickerService.new([13, 3, 2]).call).to eq 'No profitable offer'
  end
end

