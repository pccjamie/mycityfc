class Users::RegistrationsController < Devise::RegistrationsController

#IMPORTANT: If editing ANY part of this file, must restart server after saving.

before_filter :authenticate_user!

 def update
    # required for settings form to submit when password is left blank
    #user_signed_in? #&&
    current_user
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(profile_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      # redirect_to after_update_path_for(@user)
      redirect_to home_index_path

    else
      render "edit"
    end
  end

private
      def profile_params
        params.require(:user).permit!
      end     

      def teams_params
        params.require(:team).permit!
      end     

end