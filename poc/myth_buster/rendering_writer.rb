module MythBuster
  class RenderingWriter
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
      content.output_extension.empty? ? '' : ".#{content.output_extension}"
    end
  end
end
