# frozen_string_literal: true

module Api
  module V1
    class ApiBaseController < ActionController::API
      respond_to :json

      protected

      def current_authenticated_user
        @user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

      attr_reader :user
    end
  end
end
