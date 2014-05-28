class Question < ActiveRecord::Base
  validates :question, :answer, :presence => true
end
