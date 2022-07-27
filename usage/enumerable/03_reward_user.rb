# frozen_string_literal: true

ranking_user_data = 50.times.map do |i|
  {
    id: [*1..100].sample,
    score: (rand * 13_000).round
  }
end

pp ranking_user_data

require "ostruct"

users_to_be_rewarded = Enumerator.new do |enumerator|
  ranking_user_data.each do |hash_data|
    score = hash_data[:score]
    next if score < 10000

    user = OpenStruct.new
    user.id = hash_data[:id]
    user.score = score
    enumerator << user
  end
end

users_to_be_rewarded.each do |user|
  puts "Rewarding #{user.id} for #{user.score} > 10000"
end
