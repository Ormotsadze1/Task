# frozen_string_literal: true

require 'repdigit'

describe RepDigitsService do
  it 'says This is repdigit number' do
    expect(RepDigitsService.new(1111).call).to eq 'This is repdigit number.'
  end

  it 'says This is repdigit number' do
    expect(RepDigitsService.new('22222').call).to eq 'This is repdigit number.'
  end

  it 'says This is repdigit number' do
    expect(RepDigitsService.new('4444').call).to eq 'This is repdigit number.'
  end

  it 'says This isn\'t repdigit number' do
    expect(RepDigitsService.new(33344).call).to eq 'This isn\'t repdigit number'
  end

  it 'says This isn\'t repdigit number' do
    expect(RepDigitsService.new('11114444').call).to eq 'This isn\'t repdigit number'
  end

  it 'says This isn\'t repdigit number' do
    expect(RepDigitsService.new('555552').call).to eq 'This isn\'t repdigit number'
  end

  it 'raises error' do
    expect(RepDigitsService.new('111g14444').call).to eq 'Input must include only numbers'
  end

  it 'raises error' do
    expect(RepDigitsService.new('gas11111').call).to eq 'Input must include only numbers'
  end

  it 'raises error' do
    expect(RepDigitsService.new('hello').call).to eq 'Input must include only numbers'
  end

  it 'raises error' do
    expect(RepDigitsService.new('5555p').call).to eq 'Input must include only numbers'
  end
end

