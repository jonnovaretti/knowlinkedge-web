module Api
  module V1
    class MaterialsController < ApiBaseController
      def create
        study = material_params[:study]
        type = material_params[:type]
        references = material_params[:references]
        created_at = Time.now.getutc
      end
    end
  end
end
