class Competition < ApplicationRecord
  has_many :fish

  validates :year, presence: true
  validates :year, numericality: { only_integer: true }
  validates :year, length: { is: 4 }

  def weight_leaders
    fish.not_disputed.order('weight DESC NULLS LAST').limit(10)
  end

  def length_leaders
    fish.not_disputed.order('length DESC NULLS LAST').limit(10)
  end

  def species_leaders
    fish.not_disputed.group(:user_id).select('distinct(species)').count
  end
end
