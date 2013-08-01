require 'omniauth-facebook'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_APP_KEY'], ENV['FB_APP_SEC'], :display => "popup", :secure_image_url => "true"
end