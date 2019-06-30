class Post < ApplicationRecord
  belongs_to :board, dependent: :destroy
  has_one :user, through: :board

  validates :title, presence: true
end
