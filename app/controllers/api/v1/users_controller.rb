# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiBaseController
      before_action :doorkeeper_authorize!

      def index
        p 'current_user: '
        p doorkeeper_token

        respond_with current_authenticated_user
      end
    end
  end
end
