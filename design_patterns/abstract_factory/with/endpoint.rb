require_relative "factories/factory_base"

#
# When adding another variant, we need to update both chair factor and table factory.
#
class Endpoint
  def product_info(params)
    factory = FactoryBase.call(params[:category])

    chair = factory.create_chair
    table = factory.create_table
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
