module MythBuster
  module Builder
    class Questions < Array
      def first?(question)
        self.index(question) == 0
      end

      def last?(question)
        self.number(question) == self.size
      end

      def number(question)
        self.index(question) + 1
      end
    end
  end
end
