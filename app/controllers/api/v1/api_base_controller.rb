# frozen_string_literal: true

module Api
  module V1
    class ApiBaseController < ActionController::API
      rescue_from ::StandardError, with: :return_internal_server_error
      rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
      respond_to :json

      protected

      def record_not_found(e)
        render json: { messages: e.message }, status: :not_found
      end

      def return_internal_server_error
        render json: { messages: 'An error has ocurred on server' }, status: :internal_server_error
      end

      def current_authenticated_user
        @user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

      attr_reader :user
    end
  end
end
