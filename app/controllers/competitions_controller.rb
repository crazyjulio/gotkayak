class CompetitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_show_action, only: %i[show disputes]
  layout 'competition'

  def index
    @competitions = Competition.all
  end

  def show
    @fish = @competition.fish.most_recent.page(params[:page]).per(10)
    @disputes = @competition.fish.disputed
  end

  def disputes
    @fish = @competition.fish.disputed.most_recent.page(params[:page]).per(10)
    if @fish.present?
      render :show
    else
      redirect_to "/competition/#{@competition.year}", notice: 'There are currently no disputed fish'
    end
  end

  private

  def setup_show_action
    @competition = Competition.find_or_create_by(year: params[:year])
    @weight_leaders = @competition.weight_leaders
    @length_leaders = @competition.length_leaders
    @species_leaders = @competition.species_leaders
  end
end
