class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :messages

  scope :new_task, -> { where(status: 'new_task') }
  scope :incomplete, -> { where(status: 'incomplete') }
  scope :completed, -> { where(status: 'completed') }
  scope :archived, -> { where(status: 'archived') }
  # geocoded_by :from_address, :latitude => :from_latitude, :longitude => :from_longitude
  # geocoded_by :to_address, :latitude => :to_latitude, :longitude => :to_longitude
  # after_validation :geocode

  after_validation :geocode_addresses

  def geocode_addresses
    from_coord = Geocoder.coordinates(self.from_address)
    self.from_latitude = from_coord[0]
    self.from_longitude = from_coord[1]
    sleep(3) # To avoid exceeding the per-second limit
    to_coord = Geocoder.coordinates(self.to_address)
    self.to_latitude = to_coord[0]
    self.to_longitude = to_coord[1]
  end

  def accept!
    self.start_time = Time.now
    self.status = 'incomplete'
    self.save!
  end

  def complete!
    self.end_time = Time.now
    self.status = 'completed'
    self.save!
  end

end
