module MythBuster
  module Model
    class Image
      include Id::Model

      field :alt_text
      field :url
    end
  end
end
