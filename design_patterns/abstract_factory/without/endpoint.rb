require_relative "factories/chair_factory"
require_relative "factories/table_factory"

#
# When adding another variant, we need to update both chair factor and table factory.
#
class Endpoint
  def product_info(params)
    chair = ChairFactory.call(params)
    table = TableFactory.call(params)

    {
      chair: { legs: chair.legs, cushion: chair.cushion? },
      table: { material: table.material }
    }
  end
end

endpoint = Endpoint.new
puts endpoint.product_info({ category: "vintage" })
puts endpoint.product_info({ category: "modern" })
puts endpoint.product_info({ category: "regular" })
