class User < ActiveRecord::Base
  has_one :dog

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable
 
  # Returns the name of the user
  def name
   return "#{first_name} #{last_name}"
  end
end
