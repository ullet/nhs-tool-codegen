module MythBuster
  module Builder
    class Definition < Component
      attr_reader :title

      def initialize(definition_path = nil)
        instance_eval(File.read definition_path) if (File.file? definition_path)
      end

      def built
        Model::Definition.new(self.to_hash)
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
        data[:questions] << Question.new(&block)
      end

      def to_hash
        {
          title:        data[:title],
          introduction: data[:introduction].to_hash,
          related:      data[:related].to_hash,
          questions:    data[:questions].map do |q|
            qh = q.to_hash
            qh[:first] = data[:questions].first? q
            qh[:last] = data[:questions].last? q
            qh[:number] = data[:questions].number q
            qh
          end
        }
      end
    end
  end
end
