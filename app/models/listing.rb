class Listing
  include DataMapper::Resource
  has n, :requests, through: Resource
  belongs_to :user

  property :id,           Serial
  property :name,         String
  property :description,  String
  property :price,        Integer
  property :user_id,      Integer


end
