module MythBuster
  class RenderingWriter
    class << self
      attr_accessor :output_type

      def type(output_type)
        writer_class = Class.new(RenderingWriter)
        writer_class.output_type = output_type
        writer_class
      end
    end

    def initialize(content, out_dir)
      @content = content
      @out_dir = out_dir
    end

    def save
      puts "-> #{out_path}"
      File.open(out_path, 'w') { |file| file.puts content.text }
    end

    private

    attr_reader :content, :out_dir

    def out_path
      File.join(out_dir, out_file_name)
    end

    def out_file_name
      "#{content.title.split(/\s+/).join('_').downcase}#{dot_extension}"
    end

    def dot_extension
      self.class.output_type.empty? ? '' : ".#{self.class.output_type}"
    end
  end
end
