require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/listing'
require_relative 'models/request'
require_relative 'models/user'
require_relative 'models/availability'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
