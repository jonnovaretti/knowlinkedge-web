# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth', sessions: 'users/sessions',
                            registrations: 'users/registrations' }
  root 'home#index'
end
