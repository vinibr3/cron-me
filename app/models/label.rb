class Label < ApplicationRecord
  store :style, accessors: [:background_color]

  validates :title, presence: true
  validates :background_color, presence: true
end
