class Board < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  store :style, accessors: [:header_background_color, :header_text_color]

  validates :title, presence: true,
                    length: { maximum: 100 },
                    uniqueness: { case_sensitive: false, scope: :user_id }

  validates :priority, presence: true,
                       numericality: { only_integer: true }

  scope :active, -> { where(active: true) }
  scope :by_priority, -> { order('priority DESC') }
end
