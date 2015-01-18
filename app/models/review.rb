class Review < ActiveRecord::Base
  belongs_to :provider
  belongs_to :organization

  belongs_to :user
  validates :email, :name, :comment, presence: true
end
