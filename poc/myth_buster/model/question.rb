module MythBuster
  module Model
    class Question
      include Id::Model

      field :statement
      field :statement_true
      field :statement_false
      field :explanation
      field :first
      field :last
      field :number
    end
  end
end
