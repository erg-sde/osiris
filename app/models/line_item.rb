class LineItem < ApplicationRecord
  belongs_to :variety
  belongs_to :order
end
