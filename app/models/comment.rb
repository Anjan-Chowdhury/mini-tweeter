class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  

  validates :content_details, presence: true
end
