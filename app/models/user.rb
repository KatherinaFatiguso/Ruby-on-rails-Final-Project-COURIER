class User < ActiveRecord::Base
  rolify

  after_create :assign_courier_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def assign_courier_role
    self.add_role :courier
  end
  has_many :tasks
  has_many :messages
end
