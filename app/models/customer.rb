class Customer < ActiveRecord::Base
  has_many :tasks
end
