require_relative "../models/modern_table"
require_relative "../models/vintage_table"
require_relative "../models/regular_table"

#
# Same variants as chairs
#
class TableFactory
  def self.call(params)
    if params[:category] == "modern"
      ModernTable.new
    elsif params[:category] == "vintage"
      VintageTable.new
    else
      RegularTable.new
    end
  end
end
