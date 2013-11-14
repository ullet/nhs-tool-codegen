module MythBuster
  module Model
    class Introduction
      include Id::Model

      field :text
      has_one :image
      field :start_button_text
    end
  end
end
