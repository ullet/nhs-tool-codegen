module MythBuster
  module Model
    class Related
      include Id::Model

      field :text
      has_many :links
    end
  end
end
