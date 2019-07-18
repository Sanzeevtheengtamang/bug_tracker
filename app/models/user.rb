class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, :confirmable, invite_for: 2.weeks
  
  has_and_belongs_to_many :projects
  has_many :bugs

  acts_as_commontator
end
