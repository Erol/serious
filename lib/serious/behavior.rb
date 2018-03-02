module Serious
  class Behavior
    def initialize(title, &block)
      @_title = title
      @_block = block
    end

    def evaluate
      instance_eval(&@_block)
    end

    private

    def expect(given)
      Serious::Expectation.new(given)
    end
  end
end
