class Users::RegistrationsController < Devise::RegistrationsController


# def edit
#   @user = User.find(params[:id])
# end

 def update
    # required for settings form to submit when password is left blank
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
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end


  # def deletes_registration_record
  # 	  @user = User.find(current_user.id)
  # 	  @user = User.delete
  # 	  redirect_to root_path
  # end


private
      def profile_params
        params.require(:user).permit!
      end     

end