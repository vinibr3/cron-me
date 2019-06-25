class Board < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
                    length: { maximum: 100 },
                    uniqueness: { case_sensitive: false, scope: :user_id }

  validates :priority, presence: true,
                       numericality: { only_integer: true }
end
