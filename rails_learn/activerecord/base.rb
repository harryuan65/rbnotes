require 'active_record'
require 'active_support'
require 'active_support/core_ext'

ActiveRecord::Base.establish_connection(
  adapter: :postgresql,
  encoding: 'utf8',
  database: 'learn_ar',
  pool: 5
)

ActiveRecord::Base.logger = Logger.new(STDOUT)