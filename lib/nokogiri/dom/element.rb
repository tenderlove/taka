module Nokogiri
  module DOM
    module Element
      def tagName
        self.name
      end

      def getAttribute(name)
        self[name]
      end

      def setAttribute(name, value)
        self[name] = value
      end

      def removeAttribute(name)
        raise(NotImplementedError.new)
      end

      def getAttributeNode(name)
        self.attribute(name)
      end

      def setAttributeNode(new_attribute)
        self[new_attribute.name] = new_attribute.value
        self.getAttributeNode(new_attribute.name)
      end

      def removeAttributeNode(oldAttr)
        raise(NotImplementedError.new)
      end

      def getElementsByTagName(name)
        css(name)
      end

      def getAttributeNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def setAttributeNS(namespaceURI, qualifiedName, value)
        raise(NotImplementedError.new)
      end
      def removeAttributeNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def getAttributeNodeNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def setAttributeNodeNS(newAttr)
        raise(NotImplementedError.new)
      end
      def getElementsByTagNameNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def hasAttribute(name)
        raise(NotImplementedError.new)
      end
      def hasAttributeNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
    end
  end
end
