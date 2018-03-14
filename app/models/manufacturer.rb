class Manufacturer < ApplicationRecord
  validates :name, :link, presence: true
end
