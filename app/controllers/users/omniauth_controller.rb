require 'devise'

class Users::OmniauthController < Users::OmniauthCallbacksController
    def facebook
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
          sign_in_and_redirect @user
          set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      else
          flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
          redirect_to new_user_registration_url
      end
    end

    def github
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: 'GitHub') if is_navigational_format?
      else
        flash[:error] = 'There was a problem signing you in through GitHub. Please register or try signing in later.'
        redirect_to new_user_registration_url
      end
    end

    def google_oauth2
      p '111111111111111111111111111111111111111111'
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      p '22222222222222222222222222222222222222222222'
      if @user.persisted?
        p '3333333333333333333333333333333333333333333'
        sign_in_and_redirect @user
        p '444444444444444444444444444444444444444444444'
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        p '555555555555555555555555555555555555555555555'
        flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
        redirect_to new_user_registration_url
      end
    end
    
    def twitter
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
      else
        flash[:error] = 'There was a problem signing you in through Twitter. Please register or try signing in later.'
        redirect_to new_user_registration_url
      end
    end

    def failure
      flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
end
