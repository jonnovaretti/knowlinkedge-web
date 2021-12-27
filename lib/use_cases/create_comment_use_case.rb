module UseCases
  class CreateCommentUseCase < UseCaseBase
    def execute(user, params)
      study = Study.find(params[:study_id])

      @comment = Comment.new(author: user, study: study, text: params[:text])

      save_reference_material_if_has_and_belongs_to_study(study, params[:has_reference],
                                                          params[:material_id])
      successfull = comment.save
      errors << comment.errors unless successfull
    end

    def output
      { id: comment.id }
    end

    def messages
      errors
    end

    private

    attr_reader :comment, :errors

    def save_reference_material_if_has_and_belongs_to_study(study, has_reference, material_id)
      return unless has_reference

      material = Material.find(material_id)

      return unless material.belongs_to?(study)

      comment.references_to(material)
    end
  end
end
