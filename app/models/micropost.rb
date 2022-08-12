class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  scope :newest, ->{order(created_at: :desc)}
  validates :content, presence: true,
                      length: {maximum: Settings.validates.micropost.max_length}
  validates :image, content_type: {in: Settings.minipost.accept_path,
                                   message: :content_type},
                    size: {less_than: Settings.minipost.image_size.megabytes,
                           message: :size}
  delegate :name, to: :user

  def display_image
    image.variant resize_to_limit: Settings.minipost.resize_to_limit
  end
end
