class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :messages
end
