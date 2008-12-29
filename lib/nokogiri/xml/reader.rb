module Nokogiri
  module XML
    class Reader
      include Enumerable

      def each(&block)
        while node = self.read
          block.call(node)
        end
      end
      private :initialize

      def attributes
        Hash[*(properties.map { |name,node| [name, node.to_s] }.flatten)]
      end
    end
  end
end
