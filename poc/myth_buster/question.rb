module MythBuster
  class Question < Component
    def statement(value)
      data[:statement] = strip_lines value
    end

    def answer(value)
      data[:correct_answer] = value
    end

    def explanation(value)
      data[:explanation] = strip_lines value
    end
  end
end
