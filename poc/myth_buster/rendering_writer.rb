module MythBuster
  class RenderingWriter
    def initialize(content, out_dir)
      @content = content
      @out_dir = out_dir
    end

    def save
      File.open(out_path, 'w') { |file| file.puts content.text }
    end

    private

    attr_reader :content, :out_dir

    def out_path
      File.join(out_dir, "#{content.title.split(/\s+/).join('_')}.txt")
    end
  end
end
