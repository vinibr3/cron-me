class Label < ApplicationRecord
  belongs_to :user

  has_many :label_posts
  has_many :posts, through: :label_posts

  store :style, accessors: [:background_color]

  validates :title, presence: true
  validates :background_color, presence: true
end
