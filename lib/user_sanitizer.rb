class User::ParameterSanitizer < Devise::ParameterSanitizer

	#these add on to the behavior provided by the Devise parameter sanitizer
   
    private

    def sign_up
    	default_params.permit(:first_name, :name, :picture, :provider, :uid, :remember_me, :email, :password, :password_confirmation, :current_password, :city, :state, :profile)
    end

    # def sign_in
    #     default_params.permit(:first_name, :name, :picture, :provider, :uid, :remember_me, :email, :password, :password_confirmation, :current_password, :city, :state)
    # end

    # def account_update
    #     default_params.permit(:city, :state)
    # end

end

