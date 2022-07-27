# frozen_string_literal: true

class SimpleCalculator
  def self.add(string)
    raise StandardError, 'string is invalid!' if string.end_with?(',') || string.end_with?("\n")

    _, delimeter, main_string = string.match(%r{//(.+)\n(.+)}).to_a
    return sum(main_string.split(/#{delimeter}/)) if delimeter && main_string

    sum(string.split(/,|\n/))
  end

  def self.sum(string_array)
    sum = 0
    negative_numbers = []
    string_array.each do |el|
      number = el.to_i
      negative_numbers << number if number.negative?
      sum += number
    end

    if negative_numbers.any?
      "Negative number(s) are not allowed: #{negative_numbers.join(', ')}"
    else
      sum
    end
  end
end

RSpec.describe SimpleCalculator do
  it 'returns sum of comma-separated numbers' do
    expect(described_class.add('')).to eq(0)
    expect(described_class.add('1,2')).to eq(3)
    expect(described_class.add('1')).to eq(1)
  end

  context 'with input having newlines' do
    it 'returns sum of comma-separated numbers' do
      expect(described_class.add("1,2\n3")).to eq(6)
      expect { described_class.add("2,\n3") }.not_to raise_error
    end
  end

  context 'with input having separators in the end' do
    it 'raises error' do
      expect { described_class.add('2,3,') }.to raise_error(StandardError, /invalid/)
      expect { described_class.add("2,3\n") }.to raise_error(StandardError, /invalid/)
    end
  end

  context 'with custom separators at the beginning' do
    it 'returns sum of comma-separated numbers' do
      expect(described_class.add("//;\n2;3;5")).to eq(10)
      expect(described_class.add("//|\n1|2|3")).to eq(6)
    end
  end

  context 'with input having negative numbers' do
    it 'returns sum of comma-separated numbers' do
      expect(described_class.add("//;\n2;3;-5")).to eq('Negative number(s) are not allowed: -5')
      expect(described_class.add("//|\n1|-2|-3")).to eq('Negative number(s) are not allowed: -2, -3')
    end
  end
end
