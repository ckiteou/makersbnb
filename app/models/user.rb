class User
  include DataMapper::Resource

  property :id,         Serial
  property :first_name, String
  property :last_name,  String
  property :email,      String, format: :email_address, required: true, unique: true
  property :password,   Text

  def self.authenticate(email, password)
    first(email: email)
    # user = first(email: email)
    # if user && BCrypt::password.new(user.password_digest) == password
    #   user
    # else
    #   nil
    # end
  end

end
