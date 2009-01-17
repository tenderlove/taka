module Nokogiri
  module DOM
    module Attr
      def specified
        true
      end

      def parentNode
        nil
      end
    end
  end
end
