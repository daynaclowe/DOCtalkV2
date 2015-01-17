class Provider < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :kind, :address_line1, :postal_code, :city, :province, :phone, :waiting_period

  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :organizations, through: :relationships
  
  has_many :reviews
  has_many :ratings

  belongs_to :user

  #has_many :users_that_rated_this, through: :ratings, source: :user
  #has_many :users_that_reviewed_this, through: :reviews, source: :user

  def full_address
     "#{address_line1}\n#{address_line2}\n#{city}, #{province}, #{postal_code}"
  end

  # def ratings_by_user(user)
  #   rating = ratings.find_by(user: user)
  #   rating.average_rating_by_user
  # end

  def overall_rating
    (self.ratings.sum("knowledge + support + comfort + accessibility + recommendation") / (20 * ratings.count(:user_id).to_f) * 100).round(0)
  end

end
