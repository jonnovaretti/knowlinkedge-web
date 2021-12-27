module UseCases
  class CreateMaterialUseCase < UseCaseBase
    include ActiveModel::Serializers::JSON

    def execute(user, params)
      study = Study.find(params[:study_id])

      if study.belongs_to?(user)
        @material = Material.new(study: study)

        material.file.attach(params[:file])

        references = build_references(params[:references])
        material.add_references(references)

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

    def build_references(references)
      return if references.nil?

      references_created = []

      references.each do |reference|
        reference_found = create_or_find(OpenStruct.new(reference))
        references_created << reference_found
      end

      references_created
    end

    def create_or_find(reference)
      reference_found = Reference.where(title: reference.title, authors: reference.authors).first

      if reference_found.blank?
        reference_found = Reference.create(title: reference.title, authors: reference.authors, link: reference.link)
      end

      reference_found
    end
  end
end
