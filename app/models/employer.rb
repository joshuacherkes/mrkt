class Employer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :company, :email, :password, :password_confirmation

  validates :email, :uniqueness => true

  has_many :jobs
  
  
end
