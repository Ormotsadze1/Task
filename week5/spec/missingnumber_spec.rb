# frozen_string_literal: true

require 'missing_number'

describe NumbersService do
  it 'returns missing number' do
    expect(NumbersService.new([1, 2, 3, 4, 5, 6, 7, 8, 9]).call).to eq 10
  end

  it 'returns missing number' do
    expect(NumbersService.new([7, 2, 3, 6, 5, 9, 1, 4, 10]).call).to eq 8
  end

  it 'returns missing number' do
    expect(NumbersService.new([3, 2, 1, 5, 4, 6, 8, 10, 9]).call).to eq 7
  end

  it 'returns missing number' do
    expect(NumbersService.new([3, 10, 1, 7, 4, 6, 8, 2, 9]).call).to eq 5
  end

  it 'returns missing number' do
    expect(NumbersService.new(%w[3 2 1 5 4 6 8 10 9]).call).to eq 7
  end

  it 'returns missing number' do
    expect(NumbersService.new([7, 2, '3', 6, '5', '9', 1, 4, 10]).call).to eq 8
  end

  it 'raises error message' do
    expect(NumbersService.new([1, 2, 3, 4, 5, 6, 7, 8, 9,
                               10]).call).to eq 'Input must include only 9 digits from (1-10)'
  end

  it 'raises error message' do
    expect(NumbersService.new([1, 2, 3, 'a', 5, 6, 7, 8,
                               9]).call).to eq 'Input must include only 9 digits from (1-10)'
  end

  it 'raises error message' do
    expect(NumbersService.new([]).call).to eq 'Input must include only 9 digits from (1-10)'
  end

  it 'raises error message' do
    expect(NumbersService.new.call).to eq 'Input must include only 9 digits from (1-10)'
  end
end

