class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :messages

  validates :customer_id, :sender, :from_address, :receiver, :to_address, presence: true
  validates :item_count, numericality: { greater_than: 0 }, presence: true

  scope :new_task, -> { where(status: 'new_task') }
  scope :incomplete, -> { where(status: 'incomplete') }
  scope :completed, -> { where(status: 'completed') }
  scope :archived, -> { where(status: 'archived') }
  scope :signature_required, -> { where(sign_required?: true ) }
  scope :signed, -> { where(signed?: true ) }
  scope :overdue, -> { where('accepted_time < ?', Time.now - 1.day) }
  scope :todays, -> { where('accepted_time >= ?', Time.now - 2.day) }

  def self.sorted(curr_lat, curr_long)
    order("point (#{curr_lat}, #{curr_long}) <@> point (from_latitude, from_longitude)")
  end

  after_validation :geocode_addresses

  def geocode_addresses
    if from_address_changed?
      from_coord = Geocoder.coordinates(self.from_address)
      self.from_latitude = from_coord[0]
      self.from_longitude = from_coord[1]
      sleep(3) # To avoid exceeding the per-second limit
      to_coord = Geocoder.coordinates(self.to_address)
      self.to_latitude = to_coord[0]
      self.to_longitude = to_coord[1]
    end
  end

  def accept!(user_id)
    self.accepted_time = Time.now
    self.status = 'incomplete'
    user = User.find(user_id)
    self.user = user
    self.save!
  end


  def complete!
    self.accomplished_time = Time.now
    self.status = 'completed'
    self.save!
  end

  def archive!
    self.status = 'archived'
    self.save!
  end


end
