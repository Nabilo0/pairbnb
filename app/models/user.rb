class User < ActiveRecord::Base
	
has_many :listings, dependent: :destroy
has_many :reservations, dependent: :destroy

end
