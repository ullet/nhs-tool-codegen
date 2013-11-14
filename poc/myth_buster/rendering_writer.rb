module MythBuster
  class RenderingWriter
    def initialize(content, out_dir, output_extension = '')
      @content = content
      @out_dir = out_dir
      @output_extension = output_extension
    end

    def save
      puts "-> #{out_path}"
      File.open(out_path, 'w') { |file| file.puts content.text }
    end

    private

    attr_reader :content, :out_dir, :output_extension

    def out_path
      File.join(out_dir, out_file_name)
    end

    def out_file_name
      "#{content.title.split(/\s+/).join('_').downcase}#{dot_extension}"
    end

    def dot_extension
      output_extension.empty? ? '' : ".#{output_extension}"
    end
  end
end
