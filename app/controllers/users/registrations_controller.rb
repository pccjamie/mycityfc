class Users::RegistrationsController < Devise::RegistrationsController

def edit
  @user = User.find(params[:id])
end


def update

	if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
  
  @user = User.find(params[:id])
  @user.update_attributes!(profile_params)
  super
end

private
      def profile_params
        params.require(:user).permit!
      end      
end