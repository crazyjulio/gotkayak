class ClearanceItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :color
  belongs_to :version

  validates :clearance_reason, :price, :quantity, :product_id, :product_type, :presence => true
  validates :price, :quantity, :numericality => true
end
