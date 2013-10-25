module MythBuster
  class Definition < Component
    attr_reader :title

    def initialize(definition_path = nil)
      instance_eval(File.read definition_path) if (File.file? definition_path)
    end

    def title(value)
      data[:title] = value
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
