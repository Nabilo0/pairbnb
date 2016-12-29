class User < ActiveRecord::Base
  include Clearance::User

  mount_uploader :avatar, AvatarUploader

	
has_many :listings, dependent: :destroy
has_many :reservations, dependent: :destroy

has_many :authentications, :dependent => :destroy

# attr_accessor :name

def self.create_with_auth_and_hash(authentication, auth_hash)
	# byebug 
	# auth_hash
	user = User.create!(first_name: auth_hash["extra"]["raw_info"]["first_name"], last_name: auth_hash["extra"]["raw_info"]["last_name"], email: auth_hash["extra"]["raw_info"]["email"])
	#this returns a user object
	#user = User.new
	#user.name = ....
	#user.save

	user.authentications << (authentication)
	#this returns an authenticatio object
	
	return user

end

def fb_token
	x = self.authentications.where(:provider => :facebook).first
	return x.token unless x.nil?

end
	
def password_optional?
   true
 end

end
