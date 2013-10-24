require 'erb'
require_relative 'myth_buster'
require_relative 'definitions'

template = File.read 'templates/text/myth_buster.erb'

MythBuster.definitions.each do |d|
  puts ERB.new(template).result(d.get_binding)
end
