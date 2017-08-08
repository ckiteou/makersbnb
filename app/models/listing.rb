
class Listing
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String
  property :description,  String
  property :price,        Numeric
end
