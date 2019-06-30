class Post < ApplicationRecord
  belongs_to :board
  has_one :user, through: :board

  validates :title, presence: true
end
