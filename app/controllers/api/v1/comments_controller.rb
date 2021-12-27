module Api
  module V1
    class CommentsController < ApiBaseController
      def create
        use_case = UseCases::CreateCommentUseCase.new
        use_case.execute current_authenticated_user, comment_params

        if use_case.success?
          render json: { data: use_case.output }, status: :created
        else
          render json: { messages: use_case.messages.to_sentence }, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:text, :study_id, :material_id, :has_reference)
      end
    end
  end
end
