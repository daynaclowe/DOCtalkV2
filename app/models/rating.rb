class Rating < ActiveRecord::Base
  validates_presence_of :knowledge, :support, :comfort, :accessibility, :recommendation

  belongs_to :user
  belongs_to :provider

  def average_rating_by_user
    ((knowledge + support + comfort + accessibility + recommendation ) /20.0) * 100
  end

end
