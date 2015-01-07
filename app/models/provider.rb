class Provider < ActiveRecord::Base
  has_many :reviews

  def full_address
     "#{address_line1}\n#{address_line2}\n#{city}, #{province}, #{postal_code}"
  end
end
