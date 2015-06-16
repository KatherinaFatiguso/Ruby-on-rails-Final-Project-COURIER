class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :messages

  scope :new_task, -> { where(status: 'new_task') }
  scope :incomplete, -> { where(status: 'incomplete') }
  scope :completed, -> { where(status: 'completed') }
  scope :archived, -> { where(status: 'archived') }

end
