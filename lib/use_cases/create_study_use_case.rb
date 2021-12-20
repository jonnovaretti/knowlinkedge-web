module UseCases
  class CreateStudyUseCase < UseCaseBase
    def execute(author, params)
      hash_tags_list = params[:hash_tags].split(',')
      hash_tags = create_hash_tag_or_find(hash_tags_list, params[:area])

      @study = Study.new(user: author, title: params[:title], area: params[:area],
                         brief: params[:brief], hash_tags: hash_tags)

      if @study.validate
        @study.save
      else
        @errors = @study.errors.full_messages
      end
    end

    def output
      { id: study.id }
    end

    def messages
      errors
    end

    private

    attr_reader :study, :errors

    def create_hash_tag_or_find(hash_tags_list, area)
      hash_tags_found = []

      hash_tags_list.each do |hash_tag|
        hash_tags_found << HashTag.create_or_find_by(name: hash_tag, area: area)
      end

      hash_tags_found
    end
  end
end
