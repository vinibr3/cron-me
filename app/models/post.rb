class Post < ApplicationRecord
  belongs_to :board
  has_one :user, through: :board

  has_many_attached :attachments

  validates :title, presence: true
end
