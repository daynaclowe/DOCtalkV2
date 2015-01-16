class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :organizations
  has_many :providers
  has_many :reviews
  has_many :ratings
  #has_many :providers_rated, through: :ratings, source: :providers

  def full_name
    "{first_name} #{last_name}"
  end

  def rated?(provider)
    ratings.find_by(provider: provider)
  end

end
