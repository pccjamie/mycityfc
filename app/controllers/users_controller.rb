class UsersController < Devise::RegistrationsController

def update
  @user = User.find(params[:id])
  @user.update_attributes!(profile_params)
  super
end

private
      def profile_params
        params.require(:user).permit(:profile)
      end
      
end