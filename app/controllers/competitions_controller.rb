class CompetitionsController < ApplicationController
  before_action :authenticate_user!, except: %i[notification_test]
  before_action :setup_show_action, only: %i[show disputes]
  layout 'competition'

  def index
    @competitions = Competition.all
  end

  def show
    @fish = @competition.fish.most_recent.page(params[:page]).per(10)
    @disputes = @competition.fish.disputed
  end

  def current_year
    year = Date.today.year
    redirect_to "/competition/#{year}"
  end

  def disputes
    @fish = @competition.fish.disputed.most_recent.page(params[:page]).per(10)
    if @fish.present?
      render :show
    else
      redirect_to "/competition/#{@competition.year}", notice: 'There are currently no disputed fish'
    end
  end

  def notification_test
    #     app_id = ENV['GK_ONESIGNAL_APP_ID']
    #
    #     params = {
    #       app_id: app_id,
    #       contents: {
    #         en: 'Just a test'
    #       },
    #       ios_badgeType: 'None',
    #       ios_badgeCount: 1,
    #       included_segments: ['All']
    #     }
    #     begin
    #       response = OneSignal::Notification.create(params: params)
    #       notification_id = JSON.parse(response.body)['id']
    #     rescue OneSignal::OneSignalError => e
    #       puts '--- OneSignalError  :'
    #       puts "-- message : #{e.message}"
    #       puts "-- status : #{e.http_status}"
    #       puts "-- body : #{e.http_body}"
    #     end
  end

  private

  def setup_show_action
    @competition = Competition.find_or_create_by(year: params[:year])
    @weight_leaders = @competition.weight_leaders
    @length_leaders = @competition.length_leaders
    @species_leaders = @competition.species_leaders
  end
end
