class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @faqs = Question.order(:id)
  end
end
