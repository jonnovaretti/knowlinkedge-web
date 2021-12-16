require 'devise'

class Users::OmniauthController < Users::OmniauthCallbacksController
    def facebook
      authenticate_social_media('Facebook')
    end

    def github
      authenticate_social_media('GitHub')
    end

    def google_oauth2
      authenticate_social_media('Google')
    end
    
    def twitter
      authenticate_social_media('Twitter')
    end

    private

    def authenticate_social_media (social_media)
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: social_media) if is_navigational_format?
      else
        flash[:error] = "There was a problem signing you in through #{social_media}. Please register or try signing in later."
        redirect_to new_user_registration_url
      end
    end
end
