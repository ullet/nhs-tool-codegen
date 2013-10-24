module MythBuster
  class Component
    def initialize(&block)
      instance_eval(&block) if block
    end

    def[](key)
      data.key?(key) ? data[key] : nil
    end

    def method_missing(symbol, *args)
      if (symbol.to_s =~ /^_(.+)\?$/)
        !self[$1.to_sym].nil?
      elsif (symbol.to_s =~ /^_(.+)$/)
        self[$1.to_sym]
      else
        super
      end
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
