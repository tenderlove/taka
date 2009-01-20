module Nokogiri
  module DOM
    class NodeList
      def initialize &block
        @block = block
      end

      def method_missing name, *args, &block
        @block.call.send(name, *args, &block)
      end
    end
  end
end
