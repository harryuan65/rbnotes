require "forwardable"

class RankingResult
  extend Forwardable
  def_delegators :@data, :<<, :push, :first, :last, :[], :to_json, :each, :map

  def initialize(data = [])
    @data = data
  end

  def reverse
    RankingResult.new(@data.reverse)
  end
end

binding.irb
