class Listing
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String
  has n, :requests, through: Resource
end
