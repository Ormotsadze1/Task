# frozen_string_literal: true

require 'sumfibonacci'

describe FibonacciService do
  it 'returns sum of all even fibonacci' do
    expect(FibonacciService.new(5).call).to eq 2
  end

  it 'returns sum of all even fibonacci' do
    expect(FibonacciService.new(10).call).to eq 44
  end

  it 'returns sum of all even fibonacci' do
    expect(FibonacciService.new(15).call).to eq 798
  end

  it 'returns sum of all even fibonacci' do
    expect(FibonacciService.new('7').call).to eq 10
  end

  it 'returns sum of all even fibonacci' do
    expect(FibonacciService.new('14').call).to eq 188
  end

  it 'returns sum of all even fibonacci' do
    expect(FibonacciService.new('0').call).to eq 0
  end

  it 'returns sum of all even fibonacci' do
    expect(FibonacciService.new.call).to eq 0
  end

  it 'raises error' do
    expect(FibonacciService.new('gafsibc').call).to eq 'Input must include only a number'
  end

  it 'raises error' do
    expect(FibonacciService.new('123b').call).to eq 'Input must include only a number'
  end

  it 'raises error' do
    expect(FibonacciService.new('vasf1214').call).to eq 'Input must include only a number'
  end
end
