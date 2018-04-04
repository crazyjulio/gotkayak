class FishController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :find_fish, only: %i[resolve_dispute dispute comment edit_comment]
  before_action :authorize_user_to_edit, only: %i[edit update]
  before_action :authorize_user_to_dispute, only: %i[dispute]
  before_action :authorize_user_to_resolve_dispute, only: %i[resolve_dispute]
  after_action :notify_users_about_fish, only: %i[create]

  layout 'competition'

  include Notification

  def species
    fish = Fish.order(:species).where('species ilike ?', "%#{params[:term]}%")
    render json: fish.map(&:species).uniq
  end

  def locations
    fish = Fish.order(:location).where('location ilike ?', "%#{params[:term]}%")
    render json: fish.map(&:location).uniq
  end

  def resolve_dispute
    @fish.disputed_by = nil
    add_comment('resolution')
    save_fish_with_comments(notice: 'The dispute has been successfully resolved.', alert: 'The dispute was not resolved. Please try again shortly.')
  end

  def dispute
    @fish.disputed_by = current_user.id
    add_comment('dispute')
    save_fish_with_dispute_comments(notice: "You have successfully disputed #{@fish.user_name}'s #{@fish.species}.", alert: 'The dispute was not successfully created. Please try again shortly.')
  end

  def comment
    add_comment('regular')
    save_fish_with_comments(notice: "Comment added to #{@fish.user_name}'s #{@fish.species}.", alert: 'The comment was not successfully created. Please try again shortly.')
  end

  def edit_comment
    original_comment = JSON.parse(params['original_comment'])
    comment = @fish.comments.select { |comment| comment['comment'] == original_comment['comment'] && comment['user_id'] == original_comment['user_id'] && comment['type'] == original_comment['type'] }
    if comment.empty?
      redirect_to current_competition_path, alert: 'Comment was not updated successfully. Please try again shortly.'
    else
      comment[0]['comment'] = params['new_comment']
      save_fish_with_comments(notice: 'Comment updated successfully', alert: 'Comment was not updated successfully. Please try again shortly.')
    end
  end

  private

  def notify_users_about_fish
    send_notification(segments: ['All Fish'], message: "#{current_user.name} caught a #{@fish.species}!")
  end

  def save_fish_with_dispute_comments(notice:, alert:)
    path = from_disputes? ? dispute_path : current_competition_path
    if @fish.save
      user = User.find(@fish.user_id)
      DisputeMailer.fish_disputed(user, current_user.name, @fish, params[:comment]).deliver_now
      redirect_to path, notice: notice
    else
      redirect_to path, alert: alert
    end
  end

  def save_fish_with_comments(notice:, alert:)
    path = from_disputes? ? dispute_path : current_competition_path
    if @fish.save
      redirect_to path, notice: notice
    else
      redirect_to path, alert: alert
    end
  end

  def from_disputes?
    request.referer.match(/disputes/).present?
  end

  def add_comment(comment_type)
    comment_time = Time.now
    @fish.comments = [] if @fish.comments.nil?
    @fish.comments << { type: comment_type, comment: params[:comment], user_id: current_user.id, comment_time: comment_time }
    send_notification(segments: ['All Comments'], message: "#{current_user.name} commented on #{@fish.user_name}'s #{@fish.species} at #{comment_time.strftime('%l:%M')}")
  end

  def current_year
    Date.today.year
  end

  def current_competition_path
    if params['page'].present? && !params['page'].empty?
      "/competition/#{current_year}?page=#{params['page']}"
    else
      "/competition/#{current_year}"
    end
  end

  def dispute_path
    if params['page'].present? && !params['page'].empty?
      "/competition/#{current_year}/disputes?page=#{params['page']}"
    else
      "/competition/#{current_year}/disputes"
    end
  end

  def find_fish
    @fish = Fish.find(params[:fish_id])
  end

  def authorize_user_to_dispute
    if @fish.user_id == current_user.id
      redirect_to current_competition_path, alert: "You can't dispute your own fish."
    end
  end

  def authorize_user_to_resolve_dispute
    if @fish.disputed_by != current_user.id
      redirect_to current_competition_path, alert: "You can't resolve someone else's dispute."
    end
  end

  def authorize_user_to_edit
    if current_user.id != Fish.find(params[:id]).user_id
      redirect_to current_competition_path, alert: 'You can only edit your own fish.'
    end
  end

  def fish_params
    params.require(:fish).permit(:species, :length, :weight, :location, :water_type, :catch_date, :comment, :disputed_by, :user_comment, :user_id, :competition_id, :remove_images, :images_cache, images: [])
  end
end
