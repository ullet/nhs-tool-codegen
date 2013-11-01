module MythBuster
  module Text
    class Rendering < MythBuster::Rendering
      def output_extension
        'txt'
      end

      protected

      def output_type
        'text'
      end
    end
  end
end