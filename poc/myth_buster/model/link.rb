module MythBuster
  module Model
    class Link
      include Id::Model

      field :text
      field :url
    end
  end
end
