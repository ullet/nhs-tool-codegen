require_relative 'component'
require_relative 'link'

module MythBuster
  class RelatedLinks < Component
    def text(value)
      data[:text] = value
    end

    def link(&block)
      data[:links] = [] unless data[:links]
      data[:links] << Link.new(&block)
    end
  end
end
