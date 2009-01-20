module Nokogiri
  module DOM
    module DTD
      def entities
        super.extend(DOM::NamedNodeMap)
      end

      def attributes
        super.extend(DOM::NamedNodeMap)
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
