class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   attr_accessible :email, :password, :password_confirmation

   has_many :userseenjobs 
   has_many :seenjobs, :through => :userseenjobs, :source => :job

   has_many :matches

   has_one :profile, :dependent => :destroy 
   has_many :skills, :through => :profile
end
