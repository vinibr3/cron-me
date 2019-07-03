class Label < ApplicationRecord
  belongs_to :user

  store :style, accessors: [:background_color]

  validates :title, presence: true
  validates :background_color, presence: true
end
