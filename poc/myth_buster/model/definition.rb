module MythBuster
  module Model
    class Definition
      include Id::Model

      field :title
      has_one :introduction
      has_one :related
      has_many :questions

      def get_binding
        binding
      end
    end
  end
end
