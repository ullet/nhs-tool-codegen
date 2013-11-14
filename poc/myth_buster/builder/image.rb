module MythBuster
  module Builder
    class Image < Component
      def url(value)
        data[:url] = value
      end

      def alt_text(value)
        data[:alt_text] = value
      end
    end
  end
end
