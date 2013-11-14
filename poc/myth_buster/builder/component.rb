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

      def to_hash
        Hash[data.map { |k, v| [k, value_for_hash(v)] }]
      end

      private

      def value_for_hash(obj)
        if obj.respond_to? :to_hash
          obj.to_hash
        elsif obj.kind_of? Array
          obj.map { |o| value_for_hash(o) }
        elsif obj.kind_of? Hash
          Hash[obj.map { |k, v| [k, value_for_hash(v)] }]
        else
          obj
        end
      end
    end
  end
end
