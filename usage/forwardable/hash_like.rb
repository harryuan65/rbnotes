require "forwardable"

class AppConfig
  extend Forwardable
  def_delegators :@config, :[], :[]=, :each

  def initialize(init_config)
    @config = init_config
  end

  def new_version?
    !!@config[:version] && @config[:version] >= 6.0
  end

  def port
    @config[:port] || 3000
  end
end

config = AppConfig.new({ adapter: "postgresql" })
config[:hostname] = "localhost"
config[:port] = "5432"

config = AppConfig.new({ adapter: "postgresql" })
puts config.port
