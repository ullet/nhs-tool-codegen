require_relative 'myth_buster'

# example usage: ruby generate.rb definitions demo/generated html_for_js html

module MythBuster
  Generator.new(ARGV[0], ARGV[1], Rendering.type(ARGV[2]), ARGV[3]).generate
end
