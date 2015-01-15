class Provider < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :kind, :address_line1, :postal_code, :city, :province, :phone, :waiting_period

  has_many :reviews
  has_many :ratings

  belongs_to :user

  def full_address
     "#{address_line1}\n#{address_line2}\n#{city}, #{province}, #{postal_code}"
  end
end
