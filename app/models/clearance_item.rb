class ClearanceItem < ApplicationRecord
  mount_uploader :image, ImageUploader

  PRODUCTS = ['Sierra 10', 'Mini-X', 'X-Factor', 'X-13', 'Pro 2 Tandem', 'Stealth 12', 'Stealth 14', 'X-Caliber', 'Trio-11'].freeze
  VERSIONS = ['Standard', 'Fish & Dive', 'Fish & Dive w/Rudder', 'Recreation'].freeze
  COLORS = ['Red', 'White', 'Gray Granite', 'Blue', 'Yellow', 'Lime Green', 'Mango Orange', 'Hunter Green', 'Sand', 'Stone Gray', 'Olive', 'Red/Yellow', 'Lime/Yellow', 'Orange/Yellow', 'Camo', 'Camo Sand w/Brown'].freeze
  REASONS = %w[Blemish Closeout].freeze

  validates :clearance_reason, :price, :quantity, :product, :version_name, :color, presence: true
  validates :price, :quantity, numericality: true
end
