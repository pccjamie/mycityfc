class RegistrationsController < Devise::RegistrationsController

def edit
  @user = User.find(params[:id])
end


def update
  @user = User.find(params[:id])
  @user.update(:profile)
  super
end

private
      def profile_params
        params.require(:user).permit(:profile)
      end
      
end