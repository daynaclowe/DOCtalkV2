class Provider < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :kind, :address_line1, :postal_code, :city, :province, :phone, :waiting_period

  has_many :reviews
  has_many :ratings

  belongs_to :user


  def full_address
     "#{address_line1}\n#{address_line2}\n#{city}, #{province}, #{postal_code}"
  end

  def out_of_twenty
    self.ratings.sum("knowledge + support + comfort + accessibility + recommendation")
  end

  def average_rating
    total_score = self.ratings.sum("knowledge + support + comfort + accessibility + recommendation")
    ratings_count = ratings.count(:user_id)
    if ratings_count == 0
      0
    else
      total_score / (20 * ratings_count)
    end
  end
end
