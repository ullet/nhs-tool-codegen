module MythBuster
  module HtmlForJs
    class Rendering < MythBuster::Rendering
      def output_extension
        'html'
      end

      protected

      def output_type
        'html_for_js'
      end
    end
  end
end
