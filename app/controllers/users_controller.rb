class Users::UsersController < Devise::RegistrationsController

def update
  @user = User.find(params[:id])
  @user.update_attributes!(user_params)
  super
end

	private
  def user_params
        params.require(:user).permit!
  end
   
end