module MythBuster
  module Builder
    class RelatedLinks < Component
      def text(value)
        data[:text] = strip_lines value
      end

      def link(&block)
        data[:links] = [] unless data[:links]
        data[:links] << Link.new(&block)
      end
    end
  end
end
