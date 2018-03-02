module Serious
  class Description
    def initialize(title, &block)
      @_title = title
      @_block = block
    end

    def evaluate
      instance_eval(&@_block)
    end

    private

    def it(title, &block)
      behavior = Serious::Behavior.new(title, &block)
      behavior.evaluate
    end
  end
end
