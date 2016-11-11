class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category
  acts_as_votable

  has_many :comments, dependent: :destroy

  validates :description, presence: :true
  validates :image, presence: :true
  validates :category, presence: :true

  if Rails.env.development?
       has_attached_file :image,

       styles: { large: "450x450#", medium: "300x300#", thumb: "100x100>" },
       default_url: "/images/:style/missing.png"
      #  url: '/assets/users/:id/:style/:basename.:extension',
      #  path: ':rails_root/public/assets/users/:id/:style/:basename.:extension'

    else
    # Add dropbox config
    has_attached_file :image,

                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :styles => { large: "450x450#", medium: "300x300#", thumb: "100x100>" }
                         

                      # url: '/assets/admin_user/:id/:style/:basename.:extension',
                      # path: ':rails_root/public/assets/admin_user/:id/:style/:basename.:extension'
  end

  # has_attached_file :image, styles: { large: "450x450#", medium: "300x300#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
