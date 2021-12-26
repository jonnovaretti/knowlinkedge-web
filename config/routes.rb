# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth', sessions: 'users/sessions',
                            registrations: 'users/registrations' }
  root 'home#index'

  use_doorkeeper do
    skip_controllers :authorizations, :applications,
                     :authorized_applications
  end

  namespace :api do
    namespace :v1 do
      resources :users
      resources :studies, only: [:create]
      resources :materials, only: [:create]
    end
  end
end
