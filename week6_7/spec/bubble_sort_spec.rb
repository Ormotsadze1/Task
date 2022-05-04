# frozen_string_literal: true

require 'bubble_sort'

describe BubbleSortService do
  it 'returns sorted array' do
    expect(BubbleSortService.new([20, -11, 5, 3]).call).to eq [-11, 3, 5, 20]
  end

  it 'returns sorted array' do
    expect(BubbleSortService.new([1, 2, 3]).call).to eq [1, 2, 3]
  end

  it 'returns sorted array' do
    expect(BubbleSortService.new([5, 0, '11']).call).to eq [0, 5, 11]
  end

  it 'returns sorted array' do
    expect(BubbleSortService.new([5, 10, 5, 100]).call).to eq [5, 5, 10, 100]
  end

  it 'raises not input error' do
    expect(BubbleSortService.new.call).to eq 'Numbers not found'
  end

  it 'raises not input error' do
    expect(BubbleSortService.new([]).call).to eq 'Numbers not found'
  end

  it 'raises not input error' do
    expect(BubbleSortService.new('hello').call).to eq 'Numbers not found'
  end

  it 'raises not input error' do
    expect(BubbleSortService.new(5).call).to eq 'Numbers not found'
  end

  it 'raises not input error' do
    expect(BubbleSortService.new([100, 5, 'g', 200]).call).to eq 'Wrong parameters!'
  end

  it 'raises not input error' do
    expect(BubbleSortService.new(%w[hello world]).call).to eq 'Wrong parameters!'
  end
end

