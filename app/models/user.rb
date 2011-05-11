class User < ActiveRecord::Base
  has_many :scan_records
  has_many :products, :through => :scan_records  # TODO: delete dependencies 

  # support for user based entries
  has_many :product_details  
    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :localized_name, :screen_name, :email, :password, :password_confirmation, :remember_me
  
  # TODO: support for screen name login
  # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign_in-using-their-username-or-email-address
  
end
