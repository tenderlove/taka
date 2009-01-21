module Nokogiri
  module DOM
    module DTD
      def entities
        super.extend(DOM::NamedNodeMap)
      end

      def attributes
        nil
      end

      def notations
        super.extend(DOM::NamedNodeMap)
      end

      def elements
        super.extend(DOM::NamedNodeMap)
      end
    end
  end
end
