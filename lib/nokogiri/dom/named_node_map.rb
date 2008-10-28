module Nokogiri
  module DOM
    module NamedNodeMap
      def getNamedItem name
        self[name]
      end
    end
  end
end
