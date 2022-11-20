class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum role: [:user, :moderator, :admin]
         after_initialize :set_default_role, :if => :new_record?
         def set_default_role
          self.role ||= :user
         end
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
end
