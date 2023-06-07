class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.build_profile
  end

  def update
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'Updated your profile!'
    else
      flash.now[:error] = 'Failed to update your profile:('
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introducution,
      :gender,
      :birthday,
      :dubscribed
    )
  end
end