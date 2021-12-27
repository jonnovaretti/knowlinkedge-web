module UseCases
  class UseCaseBase
    def initialize
      @errors = []
    end

    def success?
      errors.blank?
    end

    protected

    attr_reader :errors
  end
end
