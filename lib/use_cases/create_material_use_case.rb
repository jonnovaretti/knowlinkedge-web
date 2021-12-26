module UseCases
  class CreateMaterialUseCase < UseCaseBase
    def execute(user, params)
      study = Study.find(params[:study_id])

      if study.belongs_to?(user)
        @material = Material.new(study: study)
        material.file.attach(io: File.open(Rails.root.join('public', 'atacama.jpeg')), filename: 'atacama.jpeg')
        material.save
      else
        @errors << 'The study does not belong to user'
      end
    end

    def output
      { id: material.id }
    end

    def messages
      errors
    end

    private

    attr_reader :material, :errors
  end
end
