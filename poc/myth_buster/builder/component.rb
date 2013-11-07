module MythBuster
  module Builder
    class Component
      def initialize(&block)
        instance_eval(&block) if block
      end

      def[](key)
        data.key?(key) ? data[key] : nil
      end

      protected

      def data
        @data ||= {}
      end

      def strip_lines(str)
        lines = []
        str.each_line { |l| lines << "#{l.strip}" }
        lines.join "\n"
      end
    end
  end
end
