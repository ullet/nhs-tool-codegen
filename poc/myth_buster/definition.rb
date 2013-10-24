module MythBuster
  class Definition < Component
    attr_reader :title, :intro

    def self.define(title, &block)
      MythBuster.add_definition Definition.new title, &block
    end

    def initialize(title, &block)
      data[:title] = title
      super &block
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

    def get_binding
      binding
    end
  end
end
