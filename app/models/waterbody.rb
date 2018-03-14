class Waterbody < ApplicationRecord
  TYPES = ['bay', 'bayou', 'brook', 'canal', 'channel', 'cove', 'creek', 'estuary', 'gulf', 'harbor', 'inlet', 'lagoon', 'lake', 'loch', 'mangrove swamp', 'marsh', 'ocean', 'oxbow lake''pond', 'puddle', 'reservoir', 'river', 'salt marsh', 'sea', 'sound', 'strait', 'stream', 'swamp', 'tidal creek', 'wetland'].freeze
  STATES = %w[Alaska Alabama Arkansas American\ Samoa Arizona California Colorado Connecticut District\ of\ Columbia Delaware Florida Georgia Guam Hawaii Iowa Idaho Illinois Indiana Kansas Kentucky Louisiana Massachusetts Maryland Maine Michigan Minnesota Missouri Mississippi Montana North\ Carolina North\ Dakota Nebraska New\ Hampshire New\ Jersey New\ Mexico Nevada New\ York Ohio Oklahoma Oregon Pennsylvania Puerto\ Rico Rhode\ Island South\ Carolina South\ Dakota Tennessee Texas Utah Virginia Virgin\ Islands Vermont Washington Wisconsin West\ Virginia Wyoming].freeze

  mount_uploader :image, ImageUploader

  has_many :trips

  validates :name, :water_type, presence: true
  validates :name, uniqueness: true
end
