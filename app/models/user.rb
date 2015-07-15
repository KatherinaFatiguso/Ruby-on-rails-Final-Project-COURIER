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

  validates :first_name, :last_name, :phone1, :address, presence: true
  validates :email, presence: true, uniqueness: true

  scope :courier_role, -> { where(self.with_any_role(:courier)) }
  scope :admin_role, -> { where(self.with_any_role(:admin)) }

=begin
 Simple Form expects there to be 'name' to render the form correctly.
 If name method is not defined, SF will give weird numbers in the drop-down list.
 Now after the 'name' is defined in models, names will appear in the form correctly.
=end
  def name
    [self.first_name, self.last_name].join(' ')
  end

  def update_location!(address)
    self.curr_addr = address
    to_coord = Geocoder.coordinates(address)
    self.curr_lat = to_coord[0]
    self.curr_long = to_coord[1]
    self.save!
  end


end
