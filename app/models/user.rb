class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :followers, dependent: :destroy

  validates :email, :first_name, :last_name, presence: true
end
