module Nokogiri
  module DOM
    class NodeList
      def initialize &block
        @block = block
      end

      def method_missing name, *args
        @block.call.send(name, *args)
      end
    end
  end
end
