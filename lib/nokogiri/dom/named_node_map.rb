module Nokogiri
  module DOM
    module NamedNodeMap
      attr_accessor :document

      def getNamedItem name
        self[name]
      end

      def removeNamedItem name
        unless key? name
          raise XML::DOMException.new(XML::DOMException::NOT_FOUND_ERR) 
        end
        raise(NotImplementedError.new)
      end

      def setNamedItem item
        if document != item.document
          raise XML::DOMException.new(XML::DOMException::WRONG_DOCUMENT_ERR)
        end

        return_item = self[item.name]

        self[item.name] = item
        return_item
      end

      def item index
        self[self.keys[index]]
      end
    end
  end
end
