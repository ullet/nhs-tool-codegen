module MythBuster
  module Builder
    class Introduction < Component
      def text(value)
        data[:text] = strip_lines value
      end

      def image(&block)
        data[:image] = Image.new &block
      end

      def start_button_text(value)
        data[:start_button_text] = value
      end
    end
  end
end
