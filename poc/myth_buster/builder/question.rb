module MythBuster
  module Builder
    class Question < Component
      def to_hash
        {
          statement:       data[:statement],
          statement_true:  data[:statement_true],
          statement_false: data[:statement_false],
          explanation:     data[:explanation]
        }
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
    end
  end
end
