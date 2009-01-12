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
        if name.length == 0 || name !~ /^\w+$/
          raise XML::DOMException.new(XML::DOMException::INVALID_CHARACTER_ERR)
        end
        self[name] = value
      end

      def removeAttribute(name)
        self.remove_attribute(name)
      end

      def getAttributeNode name
        self.attribute(name)
      end

      def setAttributeNode new_attribute
        self[new_attribute.name] = new_attribute.value
        self.getAttributeNode(new_attribute.name)
      end

      def removeAttributeNode old_attribute
        remove_attribute old_attribute.name
      end

      def getElementsByTagName(name)
        DOM::NodeList.new do
          css(name)
        end
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
