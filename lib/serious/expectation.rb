module Serious
  class Expectation
    def initialize(given)
      @_given = given
    end

    def to_be(expected)
      unless @_given === expected
        raise Serious::Failure.new("#{@_given.inspect} is not #{expected.inspect}")
      end
    end
  end
end
