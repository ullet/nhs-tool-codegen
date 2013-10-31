module MythBuster
  class Questions < Array
    def first?(question)
      self.index(question) == 0
    end

    def last?(question)
      self.index(question) + 1 == self.size
    end
  end
end
