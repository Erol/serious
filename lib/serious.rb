require 'serious/version'
require 'serious/description'
require 'serious/behavior'
require 'serious/expectation'
require 'serious/failure'

module Serious
  class << self
    def describe(title, &block)
      evaluate do
        description = Serious::Description.new(title, &block)
        description.evaluate &block
      end
    end

    def it(title, &block)
      evaluate do
        behavior = Serious::Behavior.new(title, &block)
        behavior.evaluate &block
      end
    end

    private

    def evaluate
      yield

    rescue Serious::Failure => failure

      puts "Failure: #{failure.message.lines.first}"
      puts "In: #{failure.backtrace.first}"
      puts

      puts "Backtrace:"

      failure.backtrace.slice(1..20).each do |line|
        puts "    #{line}"
      end

    rescue Exception => exception
      puts "Exception: #{exception.message.lines.first}"
      puts "In: #{exception.backtrace.first}"
      puts

      puts "Backtrace:"

      exception.backtrace.slice(1..20).each do |line|
        puts "    #{line}"
      end
    end
  end
end
