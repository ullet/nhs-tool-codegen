require_relative 'myth_buster'

# example usage: ruby generate.rb definitions ~

module MythBuster
  Generator.new(ARGV[0], ARGV[1], HtmlForJs::Rendering).generate
end
