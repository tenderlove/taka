module Nokogiri
  module DOM
    module NamedNodeMap
      def getNamedItem name
        self[name]
      end

      def item index
        self[self.keys[index]]
      end
    end
  end
end
