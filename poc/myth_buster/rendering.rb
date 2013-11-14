require 'erb'

module MythBuster
  class Rendering
    class << self
      attr_accessor :rendering_type
    end

    def self.type(rendering_type)
      rendering_class = Class.new(Rendering)
      rendering_class.rendering_type = rendering_type
      rendering_class
    end

    def initialize(content)
      @content = content
    end

    def title
      content.title
    end

    def text
      @text ||= ERB.new(template).result(content.get_binding)
    end

    protected

    def template_path
      "templates/#{rendering_type}/myth_buster.erb"
    end

    def rendering_type
      self.class.rendering_type || ''
    end

    private

    attr_reader :content

    def template
      File.read template_path
    end
  end
end
