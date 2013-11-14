module MythBuster
  module Builder
    class Question < Component
      def initialize(questions, &block)
        super &block
        @questions = questions
      end

      def statement(value)
        data[:statement] = strip_lines value
      end

      def answer(value)
        data[:statement_true] = value
        data[:statement_false] = !value
      end

      def explanation(value)
        data[:explanation] = strip_lines value
      end

      def to_hash
        h = super
        h[:first] = questions.first? self
        h[:last] = questions.last? self
        h[:number] = questions.number self
        h
      end

      attr_reader :questions
    end
  end
end
