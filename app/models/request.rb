class Request
  include DataMapper::Resource

  property :id,           Serial
  property :guest_name,   String
  property :guest_email,  String
end
