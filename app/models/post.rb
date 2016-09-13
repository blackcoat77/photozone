class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  # Validation of post fields
  validates :description, presence: :true
  validates :image, presence: :true

  has_attached_file :image, styles: { large: "450x450#", medium: "300x300#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
