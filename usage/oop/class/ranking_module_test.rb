require 'pry'
require 'rails'
require 'active_support'

module Xmas
  def xmas
    fetch_ranking(Time.now, Time.now + 5.day)
  end
end
class FetcherService
  include Xmas

  def initialize(rank_name)
    @rank_name = rank_name
  end

  def get_ranking
    if self.methods.includes?(@rank_name)
      self.send(@rank_name)
    else
      []
    end
  end

  private
  def fetch_ranking(from, to)
    puts from, to
  end
end
service = FetcherService.new("xmas")
binding.pry