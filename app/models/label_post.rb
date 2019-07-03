class LabelPost < ApplicationRecord
  belongs_to :label
  belongs_to :post

  validates :label_id, uniqueness: { scope: :post_id }
end
