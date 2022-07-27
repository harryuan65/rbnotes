class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say_hi_to(user)
    puts "hi #{user.name}"
  end
end

RSpec.describe 'Something' do
  it 'passes' do
    user = double(name: 'stan')
    expect(user.name).to eq('stan')
  end

  it 'passes' do
    user = User.new('harry')
    user2 = User.new('stan')
    expect(user2).to receive(:name)

    user.say_hi_to(user2)
  end

  it 'passes' do
    user = User.new('harry')
    user2 = spy(name: 'stan')
    user.say_hi_to(user2)

    expect(user2).to have_received(:name)
  end
end