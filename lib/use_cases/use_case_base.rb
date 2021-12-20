module UseCases
  class UseCaseBase
    def initialize
      @errors = nil
    end

    def success?
      errors.nil?
    end

    protected

    attr_reader :errors
  end
end
