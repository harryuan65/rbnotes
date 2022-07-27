require 'spec_helper'

RSpec.describe 'check equally of arrays' do
  it 'checks eq' do
    expect([1,2,3]).to eq([1,2,3])
  end

  it 'checks sequence with eq' do
    expect([1,2,3]).not_to eq([2,1,3]) # sequence is important
  end

  it 'checks contain_exactly' do
    expect([1,2,3]).to contain_exactly(1,2,3)
  end

  it 'checks contain_exactly does not care seq' do
    expect([1,2,3]).to contain_exactly(1,3,2)
  end
end