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

      def[](key)
        case key
        when :first
          questions.first? self
        when :last
          questions.last? self
        when :number
          questions.number self
        else
          super key
        end
      end

      attr_reader :questions
    end
  end
end
