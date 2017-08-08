class Listing
  include DataMapper::Resource
  has n, :requests, through: Resource
  property :id,           Serial
  property :name,         String
  property :description,  String
  property :price,        Numeric

end
