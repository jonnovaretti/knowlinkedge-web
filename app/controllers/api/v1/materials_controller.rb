module Api
  module V1
    class MaterialsController < ApiBaseController
      def create
        use_case = UseCases::CreateMaterialUseCase.new
        use_case.execute(current_authenticated_user, material_params)

        if use_case.success?
          render json: { data: use_case.output }, status: :created
        else
          render json: { messages: use_case.messages.to_sentence }, status: :unprocessable_entity
        end
      end

      private

      def material_params
        params.require(:material).permit(:file, :study_id)
      end
    end
  end
end
