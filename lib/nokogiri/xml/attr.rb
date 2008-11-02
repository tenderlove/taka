module Nokogiri
  module XML
    class Attr < Node
      def value
        children.first.text
      end

      def == other
        return false unless other.is_a?(Attr)
        return self.name == other.name && self.value == other.value
      end
    end
  end
end
