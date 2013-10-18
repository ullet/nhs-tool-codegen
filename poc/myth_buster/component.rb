module MythBuster
  class Component
    def initialize(&block)
      @data = {}
      instance_eval(&block) if block
    end

    def[](key)
      data.key?(key) ? data[key] : nil
    end

    protected

    attr_reader :data
  end
end
