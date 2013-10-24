module MythBuster
  class Link < Component
    def url(value)
      data[:url] = value
    end

    def text(value)
      data[:text] = value
    end
  end
end
