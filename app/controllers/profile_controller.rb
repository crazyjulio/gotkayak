class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update]
  layout 'competition'

  def show
    @user = current_user
    set_fish
  end

  def show_other_users_profile
    @user = User.friendly.find(params[:id])
    set_fish
    render :show
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_edit_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_fish
    @fish = @user.fish.order(catch_date: :desc)
  end

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :remove_image, :image_cache, :image)
  end
end
