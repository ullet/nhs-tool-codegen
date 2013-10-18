require_relative 'component'

module MythBuster
  class Question < Component
    def statement(value)
      data[:statement] = value
    end

    def answer(value)
      data[:correct_answer] = value
    end

    def explanation(value)
      data[:explanation] = value
    end
  end
end
