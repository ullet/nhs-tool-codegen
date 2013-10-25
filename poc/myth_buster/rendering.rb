require 'erb'

module MythBuster
  class Rendering
    def initialize(content)
      @content = content
    end

    def title
      content._title
    end

    def text
      @text ||= ERB.new(template).result(content.get_binding)
    end

    protected

    def template_path
      "templates/#{output_type}/myth_buster.erb"
    end

    def output_type
      ''
    end

    private

    attr_reader :content

    def template
      File.read template_path
    end
  end
end
