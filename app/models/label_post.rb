class LabelPost < ApplicationRecord
  belongs_to :label
  belongs_to :post
end
