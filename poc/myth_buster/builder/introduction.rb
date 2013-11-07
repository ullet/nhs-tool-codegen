module MythBuster
  module Builder
    class Introduction < Component
      def text(value)
        data[:text] = strip_lines value
      end

      def image(value)
        data[:image] = value
      end

      def start_button_text(value)
        data[:start_button_text] = value
      end

      def to_hash
        {
          text:              data[:text],
          image:             data[:image],
          start_button_text: data[:start_button_text]
        }
      end
    end
  end
end
