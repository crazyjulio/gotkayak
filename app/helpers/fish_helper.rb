module FishHelper
  def disputed_by(user_id)
    User.find(user_id).name
  end
end
