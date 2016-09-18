class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # Validation of comment fields
  validates :user_id, presence: :true
  validates :body, presence: :true
end
