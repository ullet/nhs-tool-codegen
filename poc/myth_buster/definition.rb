require_relative 'introduction'
require_relative 'related_links'
require_relative 'question'

module MythBuster
  class Definition
    class << self
      attr_reader :definitions

      def add_definition(d)
        (Definition.definitions ||= []) << d
      end

      protected

      attr_writer :definitions
    end

    attr_reader :title, :intro

    def self.define(title, &block)
      d = Definition.new title, &block
      add_definition d
    end

    def initialize(title, &block)
      @data = {}
      data[:title] = title
      instance_eval(&block) if block
    end

    def[](key)
      data.key?(key) ? data[key] : nil
    end

    def introduction(&block)
      data[:introduction] = Introduction.new &block
    end

    def more_information(&block)
      data[:related_links] = RelatedLinks.new &block
    end

    def question(&block)
      data[:questions] = [] unless data[:questions]
      data[:questions] << Question.new(&block)
    end

    private

    attr_reader :data
  end
end
