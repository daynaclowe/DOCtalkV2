class Organization < ActiveRecord::Base
  validates_presence_of :name, :address_line1, :postal_code, :city, :province, :phone
  belongs_to :user

  has_many :reviews
  has_many :ratings

end
