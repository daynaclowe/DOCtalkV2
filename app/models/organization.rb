class Organization < ActiveRecord::Base
  validates_presence_of :name, :address_line1, :postal_code, :city, :province, :phone
  belongs_to :user

  has_many :reviews
  has_many :ratings

  def self.search(param_name, param_city)
    results = Organization.all
    if param_name.present?
      results = results.where("name LIKE ?", "%#{param_name}%")
    end
    if param_city.present?
      if param_city == "Any"
      else
        results = results.where(city: param_city)
      end
    end
    results
  end
end