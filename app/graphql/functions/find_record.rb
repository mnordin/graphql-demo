module Functions
  class FindRecord < GraphQL::Function
    def initialize(model:, type:)
      @model = model
      @type = type
    end

    attr_reader :type

    argument :id, !types.ID

    def call(object, arguments, context)
      model.find(arguments[:id])
    end

    private

    attr_reader :model
  end
end
