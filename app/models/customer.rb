class Customer < ActiveRecord::Base
  has_many :tasks

  validates :first_name, :last_name, :phone1, :address, presence: true
  validates :email, presence: true, uniqueness: true

=begin
 Simple Form expects there to be 'name' to render the form correctly.
 If name method is not defined, SF will give weird numbers in the drop-down list.
 Now after the 'name' is defined in models, names will appear in the form correctly.
=end
  def name
    [self.first_name, self.last_name].join(' ')
  end

end
