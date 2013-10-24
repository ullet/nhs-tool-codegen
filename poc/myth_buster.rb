module MythBuster
  class << self
    attr_reader :definitions

    def add_definition(d)
      (MythBuster.definitions ||= []) << d
    end

    protected

    attr_writer :definitions
  end
end

require_relative 'myth_buster/component'
require_relative 'myth_buster/definition'
require_relative 'myth_buster/introduction'
require_relative 'myth_buster/related_links'
require_relative 'myth_buster/link'
require_relative 'myth_buster/question'
