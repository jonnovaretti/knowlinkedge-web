# frozen_string_literal: true

module Api
  module V1
    class StudiesController < ApiBaseController
      def create
        title = study_params[:title]
        author = current_authenticated_user
        created_at = Time.now.getutc
        hash_tags = study_params[:hash_tags]

        study = Study.new(author, title, hash_tags, created_at)

        if study.save
          render json: { data: study }, status: :created
        else
          render json: study.errors, status: :unprocessable_entity
        end
      end

      private

      def study_params
        params.require(:study).permit(:title, :hash_tags)
      end
    end
  end
end
