module Nokogiri
  module XML
    class Attr < Node
      def == other
        return false unless other.is_a?(Attr)
        return self.name == other.name && self.value == other.value
      end

      def value
        content
      end
      alias :to_s :value

      def content= value
        self.value = value
      end
    end
  end
end
