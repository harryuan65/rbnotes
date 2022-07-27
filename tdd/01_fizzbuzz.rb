# frozen_string_literal: true

fizzBuzz = lambda do |input|
  {
    15 => 'FizzBuzz',
    3 => 'Fizz',
    5 => 'Buzz'
  }.each do |check, output|
    return output if input % check == 0
  end

  input.to_s
end

RSpec.describe fizzBuzz do
  it 'returns a string' do
    expect(subject[1]).to eq('1')
  end

  context 'with multiples of 3 as input' do
    it 'returns Fizz' do
      expect(subject[3]).to eq('Fizz')
      expect(subject[6]).to eq('Fizz')
      expect(subject[9]).to eq('Fizz')
    end
  end

  context 'with multiples of 5 as input' do
    it 'returns Buzz' do
      expect(subject[5]).to eq('Buzz')
      expect(subject[10]).to eq('Buzz')
      expect(subject[20]).to eq('Buzz')
    end
  end

  context 'with multiples of both 3 and 5 as input' do
    it 'returns FizzBuzz' do
      expect(subject[15]).to eq('FizzBuzz')
      expect(subject[30]).to eq('FizzBuzz')
      expect(subject[45]).to eq('FizzBuzz')
    end
  end
end
