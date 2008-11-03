module Nokogiri
  module XML
    class Attr < Node
      def == other
        return false unless other.is_a?(Attr)
        return self.name == other.name && self.value == other.value
      end

      def value
        self.children.first.to_s
      end
      alias :to_s :value
    end
  end
end
