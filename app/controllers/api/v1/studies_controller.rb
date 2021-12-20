module Api
  module V1
    class StudiesController < ApiBaseController
      def create
        author = current_authenticated_user

        use_case = UseCases::CreateStudyUseCase.new
        use_case.execute(author, study_params)

        if use_case.success?
          render json: { data: use_case.output.to_json }, status: :created
        else
          render json: { messages: use_case.messages.to_sentence }, status: :unprocessable_entity
        end
      end

      private

      def study_params
        params.require(:study).permit(:title, :area, :brief, :hash_tags)
      end
    end
  end
end
