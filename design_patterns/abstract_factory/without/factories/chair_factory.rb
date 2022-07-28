require_relative "../models/modern_chair"
require_relative "../models/vintage_chair"
require_relative "../models/regular_chair"

class ChairFactory
  def self.call(params)
    if params[:category] == "modern"
      ModernChair.new
    elsif params[:category] == "vintage"
      VintageChair.new
    else
      RegularChair.new
    end
  end
end
