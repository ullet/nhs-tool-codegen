module MythBuster
  module Builder
    class Link < Component
      def url(value)
        data[:url] = value
      end

      def text(value)
        data[:text] = value
      end

      def to_hash
        { text: data[:text], url: data[:url] }
      end
    end
  end
end
