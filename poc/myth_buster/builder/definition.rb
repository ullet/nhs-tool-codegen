module MythBuster
  module Builder
    class Definition < Component
      attr_reader :title

      def initialize(definition_path = nil)
        instance_eval(File.read definition_path) if (File.file? definition_path)
      end

      def built
        Model::Definition.new(self)
      end

      def title(value)
        data[:title] = value
      end

      def introduction(&block)
        data[:introduction] = Introduction.new &block
      end

      def more_information(&block)
        data[:related] = RelatedLinks.new &block
      end

      def question(&block)
        data[:questions] = Questions.new unless data[:questions]
        data[:questions] << Question.new(data[:questions], &block)
      end
    end
  end
end
