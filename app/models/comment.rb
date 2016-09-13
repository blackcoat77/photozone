class Comment < ApplicationRecord
  belongs_to :post

  # Validation of comment fields
  validates :commenter, presence: :true
  validates :body, presence: :true
end
