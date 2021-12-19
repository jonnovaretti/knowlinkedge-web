# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    Doorkeeper::AccessToken.create(
      resource_owner_id: current_user.id,
      refresh_token: generate_refresh_token,
      expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
      scopes: ''
    )
  end

  def generate_refresh_token
    loop do
      token = SecureRandom.hex(32)
      break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
    end
  end
end
