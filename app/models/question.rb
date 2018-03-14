class Question < ApplicationRecord
  validates :question, :answer, presence: true
end
