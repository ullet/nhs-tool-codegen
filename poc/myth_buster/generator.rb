module MythBuster
  class Generator
    def initialize(definitions_dir, out_dir, rendering, rendering_writer)
      @defs_dir = definitions_dir
      @out_dir = out_dir
      @rendering = rendering
      @rendering_writer = rendering_writer
    end

    def generate
      renderings.each { |r| r.save }
    end

    private

    attr_reader :defs_dir, :out_dir, :rendering, :rendering_writer

    def renderings
      definitions.map { |d| rendering_writer.new(rendering.new(d), out_dir) }
    end

    def definitions
      @definitions ||= load_definitions
    end

    def load_definitions
      definition_paths.map { |p| Builder::Definition.new(p).built }
    end

    def definition_paths
      Dir.open(defs_dir) do |dir|
        dir.select { |e| e =~ /\.def$/ }.map { |e| File.join(dir, e) } if dir
      end
    end
  end
end
